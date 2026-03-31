package com.blank.bm15.model.core;

import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.League;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.crud.Tactic;
import com.blank.bm15.model.object.crud.Trade;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class ManageSeasons {
    public static void updatingPlayers(Game game) {
        String teamName;
        Player filter = new Player(game.getContext());
        filter.setGame(game);
        List<Player> playerList = BlankDao.getSome(filter);
        List<Player> removePlayersList = new ArrayList<>();
        for (Player player : playerList) {
            int probability = 5;
            if (playerList.size() < 500) {
                probability = 1;
            } else if (playerList.size() < 550) {
                probability = 2;
            } else if (playerList.size() < 600) {
                probability = 3;
            } else if (playerList.size() < 650) {
                probability = 4;
            }
            int extraProbabilityForFreeAgents = 0;
            if (player.getTeam().getId() == null && playerList.size() > 650 && player.getAge().intValue() > 25) {
                extraProbabilityForFreeAgents = 3;
            }
            int retirement = player.getAge().intValue() + 40 + probability + extraProbabilityForFreeAgents;
            if ((player.getAge().intValue() > 40 || (player.getAge().intValue() > 22 && retirement > player.getAverageSkillAll().doubleValue())) && (Util.getRandomValue(1, 5).intValue() <= probability || player.getAge().intValue() > 40)) {
                removePlayersList.add(player);
            }
            player.setStateForm(Util.getRandomValue(30, 70));
            player.setStateEnergy(99);
            player.setStateInjury(0);
            player.setAge(Integer.valueOf(player.getAge().intValue() + 1));
            player.setYearsExperience(Integer.valueOf(player.getYearsExperience().intValue() + 1));
            if (player.getYearsContract().intValue() > 0) {
                player.setYearsContract(Integer.valueOf(player.getYearsContract().intValue() - 1));
            }
        }
        BlankDao.saveOrUpdateAll(playerList);
        News newsFilter = new News(game.getContext());
        newsFilter.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(newsFilter));
        if (!removePlayersList.isEmpty()) {
            String retiredPlayersUser = "";
            String retiredPlayersOther = "";
            for (Player player2 : removePlayersList) {
                String years = player2.getAge() + " " + game.getContext().getString(R.string.free_agent_years_contract);
                if (player2.getTeam().getId() != null && player2.getTeam().getId().intValue() == game.getUserTeam().getId().intValue()) {
                    if (retiredPlayersUser.length() == 0) {
                        retiredPlayersUser = String.valueOf(retiredPlayersUser) + player2.getShortName() + ", " + years + ".";
                    } else {
                        retiredPlayersUser = String.valueOf(retiredPlayersUser) + "\n" + player2.getShortName() + ", " + years + ".";
                    }
                } else {
                    if (player2.getTeam().getId() == null) {
                        teamName = "(" + game.getContext().getString(R.string.free_agent) + ") ";
                    } else {
                        teamName = "(" + player2.getTeam().getName() + ") ";
                    }
                    if (retiredPlayersOther.length() == 0) {
                        retiredPlayersOther = String.valueOf(retiredPlayersOther) + teamName + player2.getShortName() + ", " + years + ".";
                    } else {
                        retiredPlayersOther = String.valueOf(retiredPlayersOther) + "\n" + teamName + player2.getShortName() + ", " + years + ".";
                    }
                }
            }
            BlankDao.deleteAll(removePlayersList);
            if (retiredPlayersUser.length() > 0) {
                News news = new News(game.getContext());
                news.setGame(game);
                news.setMatchday(game.getCurrentMatchday());
                news.setType(Integer.valueOf(R.drawable.news_info));
                news.setTitle(game.getContext().getString(R.string.news_retired_players_user_title));
                news.setBody(String.format(game.getContext().getString(R.string.news_retired_players_body), retiredPlayersUser));
                BlankDao.saveOrUpdate(news);
            }
            if (retiredPlayersOther.length() > 0) {
                String body = String.valueOf(game.getContext().getString(R.string.news_retired_players_other_body)) + " " + removePlayersList.size() + "\n" + retiredPlayersOther;
                String body2 = String.valueOf(body) + "\n" + game.getContext().getString(R.string.news_active_players_other_body) + " " + (playerList.size() - removePlayersList.size());
                News news2 = new News(game.getContext());
                news2.setGame(game);
                news2.setMatchday(game.getCurrentMatchday());
                news2.setType(Integer.valueOf(R.drawable.news_info));
                news2.setTitle(game.getContext().getString(R.string.news_retired_players_other_title));
                news2.setBody(String.format(game.getContext().getString(R.string.news_retired_players_body), body2));
                BlankDao.saveOrUpdate(news2);
            }
            Tactic tacticFilter = new Tactic(game.getContext());
            tacticFilter.setGame(game);
            List<Tactic> tacticList = BlankDao.getSome(tacticFilter);
            for (Tactic tactic : tacticList) {
                tactic.setLineupTitularPointGuard(null);
                tactic.setLineupTitularShootingGuard(null);
                tactic.setLineupTitularSmallForward(null);
                tactic.setLineupTitularPowerForward(null);
                tactic.setLineupTitularCenter(null);
                tactic.setLineupReservePointGuard(null);
                tactic.setLineupReserveShootingGuard(null);
                tactic.setLineupReserveSmallForward(null);
                tactic.setLineupReservePowerForward(null);
                tactic.setLineupReserveCenter(null);
                tactic.setTacticBenchImportance(null);
                tactic.setTacticGameType(null);
                tactic.setTacticShotIntPercent(null);
                tactic.setTacticShotTriplePercent(null);
                tactic.setTacticStarOne(null);
                tactic.setTacticStarTwo(null);
                tactic.setTacticStarThree(null);
            }
            BlankDao.saveOrUpdateAll(tacticList);
        }
    }

    public static void deletingOldSeason(Game game) {
        MatchResult matchResultFilter = new MatchResult(game.getContext());
        matchResultFilter.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(matchResultFilter));
        Offer offerFilter = new Offer(game.getContext());
        offerFilter.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(offerFilter));
        Trade trade = new Trade(game.getContext());
        trade.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(trade));
        Playoffs playoffsFilter = new Playoffs(game.getContext());
        playoffsFilter.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(playoffsFilter));
        DraftRound draftRound = new DraftRound(game.getContext());
        draftRound.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(draftRound));
    }

    public static void creatingNewSeason(Game game) {
        League leagueFilter = new League(game.getContext());
        leagueFilter.setGame(game);
        List<League> leagueList = BlankDao.getSome(leagueFilter);
        List<DraftRound> draftRoundList = new ArrayList<>();
        for (League league : leagueList) {
            league.setGamesLost(0);
            league.setGamesWon(0);
            league.setPointsAllowed(0);
            league.setPointsScored(0);
            DraftRound draftRound = new DraftRound(game.getContext());
            draftRound.setGame(game);
            draftRound.setTeamOwner(league.getTeam());
            draftRound.setTeamUser(league.getTeam());
            draftRound.setRound(1);
            draftRoundList.add(draftRound);
            DraftRound draftRound2 = new DraftRound(game.getContext());
            draftRound2.setGame(game);
            draftRound2.setTeamOwner(league.getTeam());
            draftRound2.setTeamUser(league.getTeam());
            draftRound2.setRound(2);
            draftRoundList.add(draftRound2);
        }
        BlankDao.saveOrUpdateAll(leagueList);
        BlankDao.saveOrUpdateAll(draftRoundList);
        Create.updateDraftRoundValues(game);
        Match matchFilter = new Match(game.getContext());
        matchFilter.setGame(game);
        List<Match> matchList = BlankDao.getSome(matchFilter);
        List<Match> matchToDeleteList = new ArrayList<>();
        for (Match match : matchList) {
            if (match.getMatchday().intValue() < 167) {
                match.setName(null);
                match.setLocalExtension(null);
                match.setLocalQuarterFirst(null);
                match.setLocalQuarterFourth(null);
                match.setLocalQuarterSecond(null);
                match.setLocalQuarterThird(null);
                match.setVisitorExtension(null);
                match.setVisitorQuarterFirst(null);
                match.setVisitorQuarterFourth(null);
                match.setVisitorQuarterSecond(null);
                match.setVisitorQuarterThird(null);
            } else {
                matchToDeleteList.add(match);
            }
        }
        BlankDao.saveOrUpdateAll(matchList);
        BlankDao.deleteAll(matchToDeleteList);
        createNews(game, 0, R.drawable.news_info, R.string.news_new_season_title, R.string.news_new_season_body, BlankObj.toString(game.getCurrentSeason()));
    }

    private static void createNews(Game game, int matchday, int type, int title, int body, Object... objects) {
        News news = new News(game.getContext());
        news.setGame(game);
        news.setMatchday(Integer.valueOf(matchday));
        news.setType(Integer.valueOf(type));
        news.setTitle(game.getContext().getString(title));
        news.setBody(String.format(game.getContext().getString(body), objects));
        BlankDao.saveOrUpdate(news);
    }
}
