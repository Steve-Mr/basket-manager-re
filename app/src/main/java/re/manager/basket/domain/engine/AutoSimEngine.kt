package re.manager.basket.domain.engine

import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import re.manager.basket.data.AppDatabase
import re.manager.basket.domain.generator.SeasonCalendar
import re.manager.basket.domain.model.Constants

class AutoSimEngine(
    private val database: AppDatabase,
    private val gameId: Int
) {
    suspend fun simulateSeasons(numSeasons: Int, progressCallback: (String) -> Unit = {}) {
        withContext(Dispatchers.IO) {
            val game = database.gameDao().getGameById(gameId)
            if (game == null) {
                Log.e("AutoSimEngine", "Game $gameId not found")
                return@withContext
            }
            
            var currentSeason = game.currentSeason
            val targetSeason = currentSeason + numSeasons

            val offseasonManager = OffseasonManager()
            val stateEvolver = StateEvolver()
            val playerDevelopment = PlayerDevelopmentEngine()
            val lineupOptimizer = LineupOptimizer()

            // Main loop
            while (currentSeason < targetSeason) {
                val activeGame = database.gameDao().getGameById(gameId) ?: break
                val currentDay = activeGame.currentMatchday

                if (currentDay == 0) {
                    progressCallback("Starting Season $currentSeason...")
                } else if (currentDay % 50 == 0) {
                    progressCallback("Season $currentSeason, Day $currentDay")
                }

                // 0. Auto-optimize ALL lineups
                val teams = database.teamDao().getTeamsByGame(gameId)
                teams.forEach { team ->
                    val players = database.playerDao().getPlayersByTeam(team.id, gameId)
                    val tactic = database.tacticDao().getTacticForTeam(team.id, gameId)
                    if (tactic != null) {
                        val optimized = lineupOptimizer.optimize(players, tactic)
                        database.tacticDao().update(optimized)
                    }
                }

                // 1. Play matches
                val matches = database.matchDao().getMatchesByDay(gameId, currentDay)
                matches.forEach { match ->
                    val localPlayers = database.playerDao().getPlayersByTeam(match.teamLocalId, gameId)
                    val visitorPlayers = database.playerDao().getPlayersByTeam(match.teamVisitorId, gameId)
                    val localTactic = database.tacticDao().getTacticForTeam(match.teamLocalId, gameId)
                    val visitorTactic = database.tacticDao().getTacticForTeam(match.teamVisitorId, gameId)

                    if (localTactic != null && visitorTactic != null) {
                        val simulator = MatchSimulator(match, localPlayers, visitorPlayers, localTactic, visitorTactic)
                        val result = simulator.simulate()

                        database.matchDao().update(result.match)
                        database.matchResultDao().insertAll(result.playerResults.filter { it.minutesPlayed > 0 })
                        val finalEvolved = result.evolvedPlayers.map { evolvedP ->
                            result.injuries.findLast { it.id == evolvedP.id }?.let { injury ->
                                evolvedP.copy(stateInjury = injury.stateInjury)
                            } ?: evolvedP
                        }
                        database.playerDao().updateAll(finalEvolved)
                    }
                }

                // 2. Daily evolution
                val allPlayers = database.playerDao().getPlayersByGame(gameId)
                val evolvedPlayersDaily = stateEvolver.evolveAllPlayersDaily(allPlayers)
                database.playerDao().updateAll(evolvedPlayersDaily)

                // 3. Move day
                val seasonManager = SeasonManager(activeGame)
                val nextDayVal = seasonManager.getNextMatchday()

                // Execute offseason events
                if (nextDayVal == Constants.OFFSEASON_RENEWALS_DAYS) {
                    progressCallback("Offseason: Evolutions & Renewals")
                    processOffseasonEvolutionsAndRetirements(gameId, playerDevelopment, offseasonManager)
                }
                if (nextDayVal == Constants.OFFSEASON_DRAFT_DAYS) {
                    progressCallback("Offseason: Draft")
                    processCpuDraft(gameId, activeGame.currentSeason, offseasonManager)
                }
                if (nextDayVal == Constants.OFFSEASON_FREE_AGENCY_DAY) {
                    progressCallback("Offseason: Free Agency")
                    processCpuFreeAgency(gameId, offseasonManager)
                }

                val updated = activeGame.copy(currentMatchday = nextDayVal)
                database.gameDao().update(updated)

                if (nextDayVal == 0) {
                    // Simulating startNewSeason logic
                    val standings = database.leagueDao().getStandings(gameId)
                    val resetStandings = standings.map { it.copy(gamesWon = 0, gamesLost = 0, pointsScored = 0, pointsAllowed = 0) }
                    database.leagueDao().updateAll(resetStandings)

                    val newMatches = SeasonCalendar.generateMatches(gameId, teams).map { it.copy(season = activeGame.currentSeason + 1) }
                    database.matchDao().deleteMatchesByGame(gameId)
                    database.matchDao().insertAll(newMatches)

                    val draftPicks = mutableListOf<re.manager.basket.data.entity.DraftPickEntity>()
                    teams.forEach { team ->
                        draftPicks.add(re.manager.basket.data.entity.DraftPickEntity(gameId = gameId, originalTeamId = team.id, currentTeamId = team.id, round = 1, year = activeGame.currentSeason + 1))
                        draftPicks.add(re.manager.basket.data.entity.DraftPickEntity(gameId = gameId, originalTeamId = team.id, currentTeamId = team.id, round = 2, year = activeGame.currentSeason + 1))
                    }
                    database.draftPickDao().insertPicks(draftPicks)
                    database.playoffDao().deletePlayoffsByGame(gameId)

                    database.gameDao().update(updated.copy(currentSeason = activeGame.currentSeason + 1))
                    currentSeason++
                    progressCallback("Completed Season ${currentSeason - 1}")
                }
            }
        }
    }

    private suspend fun processOffseasonEvolutionsAndRetirements(gameId: Int, evolver: PlayerDevelopmentEngine, offseasonManager: OffseasonManager) {
        val allPlayers = database.playerDao().getPlayersByGame(gameId)
        val updatedPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()
        val retiredPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()

        allPlayers.forEach { player ->
            if (evolver.shouldPlayerRetire(player)) {
                retiredPlayers.add(player)
            } else {
                var evolvedPlayer = evolver.evolvePlayerEndOfSeason(player)
                if (evolvedPlayer.teamId != null && evolvedPlayer.yearsContract == 0) {
                    val teamPlayers = allPlayers.filter { it.teamId == evolvedPlayer.teamId }
                    evolvedPlayer = offseasonManager.manageCpuRenewals(evolvedPlayer, teamPlayers) ?: evolvedPlayer.copy(teamId = null, salary = 0)
                }
                if (evolvedPlayer.yearsContract == 0) {
                    evolvedPlayer = evolvedPlayer.copy(teamId = null, salary = 0)
                }
                updatedPlayers.add(evolvedPlayer)
            }
        }
        database.playerDao().updateAll(updatedPlayers)
        database.playerDao().deleteAllPlayers(retiredPlayers)

        val newRookies = offseasonManager.generateDraftPlayers(90).map { it.copy(gameId = gameId) }
        database.playerDao().insertAll(newRookies)
    }

    private suspend fun processCpuDraft(gameId: Int, currentSeason: Int, offseasonManager: OffseasonManager) {
        val allPlayers = database.playerDao().getPlayersByGame(gameId)
        val draftPicks = database.draftPickDao().getPicksByYear(gameId, currentSeason)
        val standings = database.leagueDao().getStandings(gameId).sortedBy { it.gamesWon }
        val rookies = allPlayers.filter { it.teamId == null && it.yearsExperience == 0 }.toMutableList()
        val updatedPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()

        val pickOrderTeamIds = standings.map { it.teamId }
        val sortedPicks = draftPicks.sortedWith(compareBy<re.manager.basket.data.entity.DraftPickEntity> { it.round }.thenBy { pick ->
            pickOrderTeamIds.indexOf(pick.originalTeamId)
        })
        
        var currentRound = 1
        var pickNumber = 1

        for (pick in sortedPicks) {
            if (pick.round != currentRound) {
                currentRound = pick.round
                pickNumber = 1
            }
            if (rookies.isNotEmpty()) {
                val teamId = pick.currentTeamId
                val teamPlayers = allPlayers.filter { it.teamId == teamId }
                val posCount = IntArray(6) { 0 }
                teamPlayers.forEach { posCount[it.positionFirst.id]++ }
                
                val needs = listOf(1, 2, 3, 4, 5).filter { posCount[it] <= 1 }
                var selected: re.manager.basket.data.entity.PlayerEntity? = null
                val sortedRookies = rookies.sortedByDescending { it.potential }
                
                if (pick.round == 1 && pickNumber <= 3) {
                    selected = sortedRookies.take(3).randomOrNull()
                } else if (needs.isNotEmpty()) {
                    selected = sortedRookies.firstOrNull { needs.contains(it.positionFirst.id) }
                }
                if (selected == null) {
                    selected = sortedRookies.take(3).randomOrNull()
                }
                
                if (selected != null) {
                    val withContract = offseasonManager.applyDraftSalary(selected.copy(teamId = teamId), pick.round, pickNumber)
                    updatedPlayers.add(withContract)
                    rookies.remove(selected)
                }
            }
            pickNumber++
        }
        if (updatedPlayers.isNotEmpty()) {
            database.playerDao().updateAll(updatedPlayers)
        }
    }

    private suspend fun processCpuFreeAgency(gameId: Int, offseasonManager: OffseasonManager) {
        val allPlayers = database.playerDao().getPlayersByGame(gameId)
        val teams = database.teamDao().getTeamsByGame(gameId)
        val updatedPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()
        val newPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()
        
        val freeAgents = allPlayers.filter { it.teamId == null }.toMutableList()

        teams.forEach { team ->
            var teamPlayers = allPlayers.filter { it.teamId == team.id }
            var signedAny = true
            while (signedAny) {
                val signed = offseasonManager.manageCpuFreeAgency(team, teamPlayers, freeAgents)
                if (signed != null) {
                    if (signed.id == 0) {
                        newPlayers.add(signed)
                        teamPlayers = teamPlayers + signed
                    } else {
                        updatedPlayers.add(signed)
                        freeAgents.removeIf { it.id == signed.id }
                        teamPlayers = teamPlayers + signed
                    }
                } else {
                    signedAny = false
                }
            }
        }

        if (updatedPlayers.isNotEmpty()) {
            database.playerDao().updateAll(updatedPlayers)
        }
        if (newPlayers.isNotEmpty()) {
            database.playerDao().insertAll(newPlayers)
        }
    }
}
