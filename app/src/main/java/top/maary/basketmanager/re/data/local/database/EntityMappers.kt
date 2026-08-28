package top.maary.basketmanager.re.data.local.database

import top.maary.basketmanager.re.data.local.entity.*
import top.maary.basketmanager.re.domain.model.*

fun PlayerEntity.toDomain(): Player = Player(
    id = id,
    gameId = gameId,
    teamId = teamId,
    name = name,
    age = age,
    potential = potential,
    yearsContract = yearsContract,
    salary = salary,
    loyalty = loyalty,
    yearsExperience = yearsExperience,
    positionFirst = Position.fromId(positionFirst),
    positionSecond = Position.fromId(positionSecond),
    skillPhysique = skillPhysique,
    skillBlock = skillBlock,
    skillSteal = skillSteal,
    skillRebound = skillRebound,
    skillPass = skillPass,
    skillShotInterior = skillShotInterior,
    skillShotExterior = skillShotExterior,
    skillShotFree = skillShotFree,
    stateEnergy = stateEnergy,
    stateForm = stateForm,
    stateInjury = stateInjury
)

fun Player.toEntity(): PlayerEntity = PlayerEntity(
    id = id,
    gameId = gameId,
    teamId = teamId,
    name = name,
    age = age,
    potential = potential,
    yearsContract = yearsContract,
    salary = salary,
    loyalty = loyalty,
    yearsExperience = yearsExperience,
    positionFirst = positionFirst.id,
    positionSecond = positionSecond.id,
    skillPhysique = skillPhysique,
    skillBlock = skillBlock,
    skillSteal = skillSteal,
    skillRebound = skillRebound,
    skillPass = skillPass,
    skillShotInterior = skillShotInterior,
    skillShotExterior = skillShotExterior,
    skillShotFree = skillShotFree,
    stateEnergy = stateEnergy,
    stateForm = stateForm,
    stateInjury = stateInjury
)

fun TeamEntity.toDomain(): Team = Team(
    id = id,
    gameId = gameId,
    name = name,
    fullName = fullName,
    conference = Conference.fromId(conference),
    division = Division.fromId(division),
    salaryCap = salaryCap,
    colorHex = colorHex
)

fun Team.toEntity(): TeamEntity = TeamEntity(
    id = id,
    gameId = gameId,
    name = name,
    fullName = fullName,
    conference = conference.id,
    division = division.id,
    salaryCap = salaryCap,
    colorHex = colorHex
)

fun TacticEntity.toDomain(): Tactic = Tactic(
    id = id,
    gameId = gameId,
    teamId = teamId,
    gameType = gameType,
    benchImportance = benchImportance,
    shotInteriorPercent = shotInteriorPercent,
    shotTriplePercent = shotTriplePercent,
    starterPgId = starterPgId,
    starterSgId = starterSgId,
    starterSfId = starterSfId,
    starterPfId = starterPfId,
    starterCId = starterCId,
    reservePgId = reservePgId,
    reserveSgId = reserveSgId,
    reserveSfId = reserveSfId,
    reservePfId = reservePfId,
    reserveCId = reserveCId,
    starOnePlayerId = starOnePlayerId,
    starTwoPlayerId = starTwoPlayerId,
    starThreePlayerId = starThreePlayerId
)

fun Tactic.toEntity(): TacticEntity = TacticEntity(
    id = id,
    gameId = gameId,
    teamId = teamId,
    gameType = gameType,
    benchImportance = benchImportance,
    shotInteriorPercent = shotInteriorPercent,
    shotTriplePercent = shotTriplePercent,
    starterPgId = starterPgId,
    starterSgId = starterSgId,
    starterSfId = starterSfId,
    starterPfId = starterPfId,
    starterCId = starterCId,
    reservePgId = reservePgId,
    reserveSgId = reserveSgId,
    reserveSfId = reserveSfId,
    reservePfId = reservePfId,
    reserveCId = reserveCId,
    starOnePlayerId = starOnePlayerId,
    starTwoPlayerId = starTwoPlayerId,
    starThreePlayerId = starThreePlayerId
)

fun MatchEntity.toDomain(): Match = Match(
    id = id,
    gameId = gameId,
    matchday = matchday,
    teamLocalId = teamLocalId,
    teamVisitorId = teamVisitorId,
    name = name,
    localScore = localScore,
    visitorScore = visitorScore,
    localQuarter1 = localQuarter1,
    localQuarter2 = localQuarter2,
    localQuarter3 = localQuarter3,
    localQuarter4 = localQuarter4,
    localOt = localOt,
    visitorQuarter1 = visitorQuarter1,
    visitorQuarter2 = visitorQuarter2,
    visitorQuarter3 = visitorQuarter3,
    visitorQuarter4 = visitorQuarter4,
    visitorOt = visitorOt,
    isPlayed = isPlayed
)

fun Match.toEntity(): MatchEntity = MatchEntity(
    id = id,
    gameId = gameId,
    matchday = matchday,
    teamLocalId = teamLocalId,
    teamVisitorId = teamVisitorId,
    name = name,
    localScore = localScore,
    visitorScore = visitorScore,
    localQuarter1 = localQuarter1,
    localQuarter2 = localQuarter2,
    localQuarter3 = localQuarter3,
    localQuarter4 = localQuarter4,
    localOt = localOt,
    visitorQuarter1 = visitorQuarter1,
    visitorQuarter2 = visitorQuarter2,
    visitorQuarter3 = visitorQuarter3,
    visitorQuarter4 = visitorQuarter4,
    visitorOt = visitorOt,
    isPlayed = isPlayed
)

fun MatchResultEntity.toDomain(): MatchResult = MatchResult(
    id = id,
    gameId = gameId,
    matchId = matchId,
    playerId = playerId,
    playerName = playerName,
    teamId = teamId,
    matchday = matchday,
    minutesPlayed = minutesPlayed,
    points = points,
    fouls = fouls,
    blocks = blocks,
    steals = steals,
    rebounds = rebounds,
    passesOk = passesOk,
    passesKo = passesKo,
    shotsFreeOk = shotsFreeOk,
    shotsFreeKo = shotsFreeKo,
    shotsInteriorOk = shotsInteriorOk,
    shotsInteriorKo = shotsInteriorKo,
    shotsExteriorDoubleOk = shotsExteriorDoubleOk,
    shotsExteriorDoubleKo = shotsExteriorDoubleKo,
    shotsExteriorTripleOk = shotsExteriorTripleOk,
    shotsExteriorTripleKo = shotsExteriorTripleKo
)

fun MatchResult.toEntity(): MatchResultEntity = MatchResultEntity(
    id = id,
    gameId = gameId,
    matchId = matchId,
    playerId = playerId,
    playerName = playerName,
    teamId = teamId,
    matchday = matchday,
    minutesPlayed = minutesPlayed,
    points = points,
    fouls = fouls,
    blocks = blocks,
    steals = steals,
    rebounds = rebounds,
    passesOk = passesOk,
    passesKo = passesKo,
    shotsFreeOk = shotsFreeOk,
    shotsFreeKo = shotsFreeKo,
    shotsInteriorOk = shotsInteriorOk,
    shotsInteriorKo = shotsInteriorKo,
    shotsExteriorDoubleOk = shotsExteriorDoubleOk,
    shotsExteriorDoubleKo = shotsExteriorDoubleKo,
    shotsExteriorTripleOk = shotsExteriorTripleOk,
    shotsExteriorTripleKo = shotsExteriorTripleKo
)

fun StandingsEntity.toDomain(): StandingsItem = StandingsItem(
    teamId = teamId,
    teamName = teamName,
    conference = Conference.fromId(conference),
    division = Division.fromId(division),
    gamesWon = gamesWon,
    gamesLost = gamesLost,
    pointsScored = pointsScored,
    pointsAllowed = pointsAllowed
)

fun StandingsItem.toEntity(gameId: Long): StandingsEntity = StandingsEntity(
    id = 0,
    gameId = gameId,
    teamId = teamId,
    teamName = teamName,
    conference = conference.id,
    division = division.id,
    gamesWon = gamesWon,
    gamesLost = gamesLost,
    pointsScored = pointsScored,
    pointsAllowed = pointsAllowed
)

fun NewsEntity.toDomain(): NewsItem = NewsItem(
    id = id,
    gameId = gameId,
    matchday = matchday,
    type = try { NewsType.valueOf(type) } catch (_: Exception) { NewsType.INFO },
    title = title,
    body = body,
    team1Id = team1Id,
    team2Id = team2Id,
    playerId = playerId,
    createdAt = createdAt
)

fun NewsItem.toEntity(): NewsEntity = NewsEntity(
    id = id,
    gameId = gameId,
    matchday = matchday,
    type = type.name,
    title = title,
    body = body,
    team1Id = team1Id,
    team2Id = team2Id,
    playerId = playerId,
    createdAt = createdAt
)

fun DraftPickEntity.toDomain(): DraftPick = DraftPick(
    id = id,
    gameId = gameId,
    originalTeamId = originalTeamId,
    currentTeamId = currentTeamId,
    round = round,
    position = position,
    marketValue = marketValue
)

fun DraftPick.toEntity(): DraftPickEntity = DraftPickEntity(
    id = id,
    gameId = gameId,
    originalTeamId = originalTeamId,
    currentTeamId = currentTeamId,
    round = round,
    position = position,
    marketValue = marketValue
)

fun GameSessionEntity.toDomain(): GameSession = GameSession(
    id = id,
    name = name,
    currentSeason = currentSeason,
    currentMatchday = currentMatchday,
    userTeamId = userTeamId,
    autoLineupEnabled = autoLineupEnabled,
    createdAt = createdAt,
    lastPlayedAt = lastPlayedAt
)

fun GameSession.toEntity(): GameSessionEntity = GameSessionEntity(
    id = id,
    name = name,
    currentSeason = currentSeason,
    currentMatchday = currentMatchday,
    userTeamId = userTeamId,
    autoLineupEnabled = autoLineupEnabled,
    createdAt = createdAt,
    lastPlayedAt = lastPlayedAt
)
