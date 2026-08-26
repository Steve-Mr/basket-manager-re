package com.blank.bm15.model.core;

import com.blank.bm15.activity.fragment.ChallengesFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.League;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.Rulete;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class Simulate {
    private static final int MATCH_MODIFIER_AVERAGE_VALUE = 90;
    private static final int MATCH_MODIFIER_LOCAL_BASE = 1;
    private static final int MATCH_MODIFIER_LOCAL_PLAYOFFS = 2;
    private static final int MATCH_MODIFIER_VISITOR_BASE = 0;
    private static final int MINUTES_BENCH_MULTIPLIER = 4;
    private static final int MINUTES_TOTALS = 48;
    private static final int SHOT_TYPE_EXT_DOUBLE = 2;
    private static final int SHOT_TYPE_EXT_TRIPLE = 3;
    private static final int SHOT_TYPE_INT = 1;
    private Game game;
    private List<League> leagueList;
    private List<Match> matchList;
    private List<MatchResult> matchResultList;
    private List<News> newsList;
    private List<Playoffs> playoffsList;
    private Rulete rulete;

    public Simulate(Game game) {
        this.game = game;
        Match match = new Match(game.getContext());
        match.setGame(game);
        match.setMatchday(game.getCurrentMatchday());
        this.matchList = BlankDao.getSome(match);
        this.matchResultList = new ArrayList();
        this.leagueList = new ArrayList();
        this.newsList = new ArrayList();
        Playoffs playoffs = new Playoffs(game.getContext());
        playoffs.setGame(game);
        this.playoffsList = BlankDao.getSome(playoffs);
    }

    public Integer getMatchListSize() {
        return Integer.valueOf(this.matchList.size());
    }

    public void saveAll() {
        BlankDao.saveOrUpdateAll(this.playoffsList);
        BlankDao.saveOrUpdateAll(this.leagueList);
        BlankDao.saveOrUpdateAll(this.matchList);
        BlankDao.saveOrUpdateAll(this.matchResultList);
        for (Match match : this.matchList) {
            BlankDao.saveOrUpdateAll(match.getTeamLocal().getTactic().getPlayers());
            BlankDao.saveOrUpdateAll(match.getTeamVisitor().getTactic().getPlayers());
        }
        List<Player> allPlayersList = calculateNewStateOfAllPlayers();
        BlankDao.saveOrUpdateAll(allPlayersList);
        BlankDao.saveOrUpdateAll(this.newsList);
    }

    public String playMatchOfPosition(int position) {
        Match match = this.matchList.get(position);
        if (match.getName() != null) {
            return match.getName();
        }
        setLineup(match);
        createMatchResultsAndBonus(match);
        playMatch(match);
        String localResult = match.getFinalResultLocal() + " " + match.getTeamLocal().getName();
        String visitorResult = String.valueOf(match.getTeamVisitor().getName()) + " " + match.getFinalResultVisitor();
        match.setName(String.valueOf(visitorResult) + " " + this.game.getContext().getString(R.string.match_in_home_of) + " " + localResult);
        createAllNews(match, match.getTeamLocal());
        createAllNews(match, match.getTeamVisitor());
        if (match.getIsMathOfUserTeam(this.game).booleanValue() || match.getMatchday().intValue() > 212) {
            createUserNews(match);
        }
        return match.getName();
    }

    private void setLineup(Match match) {
        if (match != null && match.getTeamLocal() != null && match.getTeamLocal().getId() != null && this.game != null && this.game.getUserTeam() != null && this.game.getUserTeam().getId() != null && match.getTeamLocal().getId().intValue() != this.game.getUserTeam().getId().intValue()) {
            Lineup.setBetterLineup(match.getTeamLocal());
        }
        if (match != null && match.getTeamVisitor() != null && match.getTeamVisitor().getId() != null && this.game != null && this.game.getUserTeam() != null && this.game.getUserTeam().getId() != null && match.getTeamVisitor().getId().intValue() != this.game.getUserTeam().getId().intValue()) {
            Lineup.setBetterLineup(match.getTeamVisitor());
        }
    }

    private void createMatchResultsAndBonus(Match match) {
        int numOfPlayers = 0;
        int localTeamAgeAverage = 0;
        int localTeamAllAverage = 0;
        int localBaseMatchModifier = 1;
        if (this.game.getCurrentMatchday().intValue() >= 167) {
            localBaseMatchModifier = 2;
        }
        for (Player player : match.getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue()) {
                MatchResult matchResult = new MatchResult(this.game.getContext());
                String text = "";
                if (player.getIsStarOne().booleanValue()) {
                    text = String.valueOf("") + "(+3) ";
                } else if (player.getIsStarTwo().booleanValue()) {
                    text = String.valueOf("") + "(+2) ";
                } else if (player.getIsStarThree().booleanValue()) {
                    text = String.valueOf("") + "(+1) ";
                }
                matchResult.setName(String.valueOf(text) + player.getShortName());
                matchResult.setGame(this.game);
                matchResult.setMatch(match);
                matchResult.setPlayer(player);
                player.setCurrentMatchResult(matchResult);
                this.matchResultList.add(matchResult);
                if (player.getAverageSkillAllByPosition(player.getPositionMatch()).doubleValue() >= 90.0d) {
                    localBaseMatchModifier++;
                }
                localTeamAgeAverage += player.getAge().intValue();
                localTeamAllAverage = (int) (((double) localTeamAllAverage) + (player.getAverageSkillAllByPosition(player.getPositionMatch()).doubleValue() * ((double) (player.getIsTitular().booleanValue() ? 2 : 1))));
                numOfPlayers++;
            }
        }
        int localTeamAgeAverage2 = localTeamAgeAverage / numOfPlayers;
        int localTeamAllAverage2 = localTeamAllAverage / numOfPlayers;
        int numOfPlayers2 = 0;
        int visitorTeamAgeAverage = 0;
        int visitorTeamAllAverage = 0;
        int visitorBaseMatchModifier = 0;
        for (Player player2 : match.getTeamVisitor().getTactic().getPlayers()) {
            if (player2.getIsInLineup().booleanValue()) {
                MatchResult matchResult2 = new MatchResult(this.game.getContext());
                String text2 = "";
                if (player2.getIsStarOne().booleanValue()) {
                    text2 = String.valueOf("") + "(+3) ";
                } else if (player2.getIsStarTwo().booleanValue()) {
                    text2 = String.valueOf("") + "(+2) ";
                } else if (player2.getIsStarThree().booleanValue()) {
                    text2 = String.valueOf("") + "(+1) ";
                }
                matchResult2.setName(String.valueOf(text2) + player2.getShortName());
                matchResult2.setGame(this.game);
                matchResult2.setMatch(match);
                matchResult2.setPlayer(player2);
                player2.setCurrentMatchResult(matchResult2);
                this.matchResultList.add(matchResult2);
                if (player2.getAverageSkillAllByPosition(player2.getPositionMatch()).doubleValue() >= 90.0d) {
                    visitorBaseMatchModifier++;
                }
                visitorTeamAgeAverage += player2.getAge().intValue();
                visitorTeamAllAverage = (int) (((double) visitorTeamAllAverage) + (player2.getAverageSkillAllByPosition(player2.getPositionMatch()).doubleValue() * ((double) (player2.getIsTitular().booleanValue() ? 2 : 1))));
                numOfPlayers2++;
            }
        }
        int visitorTeamAllAverage2 = visitorTeamAllAverage / numOfPlayers2;
        int bonoAverageAge = 167 > match.getMatchday().intValue() ? (localTeamAgeAverage2 - (visitorTeamAgeAverage / numOfPlayers2)) / 2 : 0;
        int bonoAverageAll = (localTeamAllAverage2 - visitorTeamAllAverage2) / 2;
        for (Player player3 : match.getTeamLocal().getTactic().getPlayersTitulars()) {
            player3.setBaseMatchAttackModifier(Integer.valueOf(match.getTeamLocal().getTactic().getTacticGameType().intValue() + localBaseMatchModifier + player3.getPenalty(match.getTeamLocal().getTactic().getTitularPosition(player3)).intValue()));
            player3.setBaseMatchDefenseModifier(Integer.valueOf((match.getTeamLocal().getTactic().getTacticGameType().intValue() * (-1)) + localBaseMatchModifier + player3.getPenalty(match.getTeamLocal().getTactic().getTitularPosition(player3)).intValue()));
            player3.setBaseMatchAttackModifier(Integer.valueOf(player3.getBaseMatchAttackModifier().intValue() + bonoAverageAge + bonoAverageAll));
            player3.setBaseMatchDefenseModifier(Integer.valueOf(player3.getBaseMatchDefenseModifier().intValue() + bonoAverageAge + bonoAverageAll));
        }
        for (Player player4 : match.getTeamLocal().getTactic().getPlayersReserves()) {
            player4.setBaseMatchAttackModifier(Integer.valueOf(match.getTeamLocal().getTactic().getTacticGameType().intValue() + localBaseMatchModifier + player4.getPenalty(match.getTeamLocal().getTactic().getReservePosition(player4)).intValue()));
            player4.setBaseMatchDefenseModifier(Integer.valueOf((match.getTeamLocal().getTactic().getTacticGameType().intValue() * (-1)) + localBaseMatchModifier + player4.getPenalty(match.getTeamLocal().getTactic().getReservePosition(player4)).intValue()));
            player4.setBaseMatchAttackModifier(Integer.valueOf(player4.getBaseMatchAttackModifier().intValue() + bonoAverageAge));
            player4.setBaseMatchDefenseModifier(Integer.valueOf(player4.getBaseMatchDefenseModifier().intValue() + bonoAverageAge + bonoAverageAll));
        }
        for (Player player5 : match.getTeamVisitor().getTactic().getPlayersTitulars()) {
            player5.setBaseMatchAttackModifier(Integer.valueOf(match.getTeamVisitor().getTactic().getTacticGameType().intValue() + visitorBaseMatchModifier + player5.getPenalty(match.getTeamVisitor().getTactic().getTitularPosition(player5)).intValue()));
            player5.setBaseMatchDefenseModifier(Integer.valueOf((match.getTeamVisitor().getTactic().getTacticGameType().intValue() * (-1)) + visitorBaseMatchModifier + player5.getPenalty(match.getTeamVisitor().getTactic().getTitularPosition(player5)).intValue()));
        }
        for (Player player6 : match.getTeamVisitor().getTactic().getPlayersReserves()) {
            player6.setBaseMatchAttackModifier(Integer.valueOf(match.getTeamVisitor().getTactic().getTacticGameType().intValue() + visitorBaseMatchModifier + player6.getPenalty(match.getTeamVisitor().getTactic().getReservePosition(player6)).intValue()));
            player6.setBaseMatchDefenseModifier(Integer.valueOf((match.getTeamVisitor().getTactic().getTacticGameType().intValue() * (-1)) + visitorBaseMatchModifier + player6.getPenalty(match.getTeamVisitor().getTactic().getReservePosition(player6)).intValue()));
        }
    }

    private void createUserNews(Match match) {
        int resultIcon;
        Player mvp = match.getMvp();
        Player maxPts = match.getMaxPts();
        Player maxReb = match.getMaxReb();
        Player maxAst = match.getMaxAst();
        Player maxStl = match.getMaxStl();
        Player maxBlk = match.getMaxBlk();
        if (match.getIsMathOfUserTeam(this.game).booleanValue()) {
            resultIcon = match.getTeamWinner().getId().intValue() == this.game.getUserTeam().getId().intValue() ? R.drawable.news_won : R.drawable.news_lost;
        } else {
            resultIcon = R.drawable.news_world_final;
        }
        int titleText = match.getIsMathOfUserTeam(this.game).booleanValue() ? R.string.news_match_result_title : R.string.news_playoffs_world_final_game_title;
        News news = createNewsAndAdd(match.getMatchday().intValue(), resultIcon, titleText, R.string.news_match_result_body, match.getName(), mvp.getShortName(), match.getTeamWinner().getName(), mvp.getCurrentMatchResult().getPer(), maxPts.getShortName(), maxPts.getTeam().getName(), maxPts.getCurrentMatchResult().getPoints(), maxReb.getShortName(), maxReb.getTeam().getName(), maxReb.getCurrentMatchResult().getReboundsInt(), maxAst.getShortName(), maxAst.getTeam().getName(), maxAst.getCurrentMatchResult().getPassesOkInt(), maxStl.getShortName(), maxStl.getTeam().getName(), maxStl.getCurrentMatchResult().getStealsInt(), maxBlk.getShortName(), maxBlk.getTeam().getName(), maxBlk.getCurrentMatchResult().getBlocksInt());
        news.setTeam1(match.getTeamLocal());
        news.setTeam2(match.getTeamVisitor());
    }

    private void createAllNews(Match match, Team team) {
        for (Player player : team.getTactic().getPlayers()) {
            if (player.getCurrentMatchResult() != null) {
                if (player.getCurrentMatchResult().getPoints().intValue() > 9 && player.getCurrentMatchResult().getReboundsInt().intValue() > 9 && player.getCurrentMatchResult().getPassesOk().intValue() > 9) {
                    News news = createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_mvp, R.string.news_match_tripledouble_title, R.string.news_match_tripledouble_body, player.getShortName(), player.getCurrentMatchResult().getPoints(), player.getCurrentMatchResult().getReboundsInt(), player.getCurrentMatchResult().getPassesOkInt(), match.getName());
                    news.setPlayer1(player);
                } else if (player.getCurrentMatchResult().getPer().doubleValue() > 49.0d && player.getCurrentMatchResult().getMinutesPlayed().intValue() > 23) {
                    News news2 = createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_mvp, R.string.news_match_awesome_title, R.string.news_match_awesome_body, player.getShortName(), player.getCurrentMatchResult().getPoints(), player.getCurrentMatchResult().getReboundsInt(), player.getCurrentMatchResult().getPassesOkInt(), player.getCurrentMatchResult().getBlocksInt(), player.getCurrentMatchResult().getStealsInt(), match.getName(), player.getCurrentMatchResult().getMinutesPlayed());
                    news2.setPlayer1(player);
                } else if (player.getCurrentMatchResult().getPoints().intValue() > 49) {
                    News news3 = createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_mvp, R.string.news_match_50points_title, R.string.news_match_50points_body, player.getShortName(), player.getCurrentMatchResult().getPoints(), match.getName());
                    news3.setPlayer1(player);
                }
            }
        }
    }

    private void playMatch(Match match) {
        Team teamAttack;
        Team teamDefense;
        calculateMinutes(match, Boolean.TRUE.booleanValue());
        calculateMinutes(match, Boolean.FALSE.booleanValue());
        int possessions = 120;
        this.rulete = new Rulete(match);
        for (int i = 0; i < possessions; i++) {
            if (i % 2 == 0) {
                teamAttack = match.getTeamVisitor();
                teamDefense = match.getTeamLocal();
            } else {
                teamAttack = match.getTeamLocal();
                teamDefense = match.getTeamVisitor();
            }
            playPossession(i, match, teamAttack, teamDefense);
            if (i == possessions - 1 && match.getTotalPointsLocalPlayers().intValue() == match.getTotalPointsVisitorPlayers().intValue()) {
                possessions += 5;
                match.setLocalExtension(match.getTotalPointsLocalPlayers());
                match.setVisitorExtension(match.getTotalPointsVisitorPlayers());
            }
        }
        finishMatch(match);
    }

    private void playPossession(int pos, Match match, Team teamAttack, Team teamDefense) {
        float shotModifier;
        int shotType;
        int attemptBlock;
        Player player;
        Player player2;
        Player opponent;
        Player player3;
        Player opponent2;
        Player player4;
        int shotValue = 0;
        int shotsFree = 0;
        boolean isFoul = Boolean.FALSE.booleanValue();
        if (skillAttempt(4) && teamAttack.getMoreInjuries().booleanValue() && (player4 = getRulete(0, teamAttack)) != null && !accomplishedAction((player4.getStateEnergy().intValue() * (player4.getSkillPhysique().intValue() + player4.getBaseMatchDefenseModifier().intValue())) / 100, 1.0f)) {
            if (player4.getStateInjury().intValue() == 0) {
                player4.setStateInjury(-1);
            } else if (player4.getStateInjury().intValue() == -1) {
                int damageType = Util.getRandomValue(0, 100).intValue();
                if (damageType <= 80) {
                    player4.setStateInjury(Util.getRandomValue(2, 7));
                } else if (damageType <= 99) {
                    player4.setStateInjury(Util.getRandomValue(8, 49));
                } else {
                    player4.setStateInjury(Util.getRandomValue(50, 180));
                }
                if (teamAttack.getId().intValue() == this.game.getUserTeam().getId().intValue()) {
                    News news = createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_injured, R.string.news_player_injured_title, R.string.news_player_injured_body, player4.getShortName(), Integer.valueOf(player4.getStateInjury().intValue() - 1));
                    news.setPlayer1(player4);
                }
            }
        }
        if (skillAttempt(14) && (opponent2 = getRulete(3, teamDefense)) != null && accomplishedAction(opponent2.getSkillSteal().intValue() + opponent2.getBaseMatchDefenseModifier().intValue(), 0.5f)) {
            opponent2.getCurrentMatchResult().addSteal();
            return;
        }
        if (skillAttempt(17) && (player3 = getRulete(5, teamAttack)) != null && !accomplishedAction(player3.getSkillPass().intValue() + player3.getBaseMatchAttackModifier().intValue(), 0.6f)) {
            player3.getCurrentMatchResult().addPassKO();
            return;
        }
        if (skillAttempt(10) && (opponent = getRulete(0, teamDefense)) != null) {
            opponent.getCurrentMatchResult().addFoulMade();
        }
        int assistanceModifier = 0;
        if (skillAttempt(34) && (player2 = getRulete(5, teamAttack)) != null && accomplishedAction(player2.getSkillPass().intValue() + player2.getBaseMatchAttackModifier().intValue(), 1.0f)) {
            player2.getCurrentMatchResult().addPassOK();
            assistanceModifier = 5;
        }
        if (skillAttempt(teamAttack.getTactic().getTacticShotIntPercent().intValue())) {
            shotModifier = 0.65f;
            shotType = 1;
            attemptBlock = 11;
            player = getRulete(6, teamAttack);
            if (player != null) {
                shotValue = player.getSkillShotInterior().intValue() + player.getBaseMatchAttackModifier().intValue();
            }
        } else {
            if (skillAttempt(teamAttack.getTactic().getTacticShotTriplePercent().intValue())) {
                shotModifier = 0.45f;
                shotType = 3;
            } else {
                shotModifier = 0.55f;
                shotType = 2;
            }
            attemptBlock = 9;
            player = getRulete(7, teamAttack);
            if (player != null) {
                shotValue = player.getSkillShotExterior().intValue() + player.getBaseMatchAttackModifier().intValue();
            }
        }
        if (player != null) {
            int shotValue2 = shotValue + ((shotValue * assistanceModifier) / 100);
            Player opponent3 = getRulete(2, teamDefense);
            if (skillAttempt(attemptBlock) && opponent3 != null && opponent3.getSkillBlock().intValue() + opponent3.getBaseMatchDefenseModifier().intValue() + getRandomValueGauss(0, 100) > getRandomValueGauss(0, 100) + shotValue2) {
                opponent3.getCurrentMatchResult().addBlock();
                return;
            }
            if (skillAttempt(15) && opponent3 != null && getRandomValueGauss(0, 100) + shotValue2 > opponent3.getSkillBlock().intValue() + opponent3.getBaseMatchDefenseModifier().intValue() + getRandomValueGauss(0, 100)) {
                opponent3.getCurrentMatchResult().addFoulMade();
                isFoul = Boolean.TRUE.booleanValue();
                shotValue2 -= 10;
            }
            if (accomplishedAction(shotValue2, shotModifier)) {
                if (shotType == 1) {
                    player.getCurrentMatchResult().addShotsInteriorOk();
                } else if (shotType == 2) {
                    player.getCurrentMatchResult().addShotExteriorDoubleOk();
                } else {
                    player.getCurrentMatchResult().addShotExteriorTripleOk();
                }
                if (isFoul) {
                    shotsFree = 1;
                }
            } else {
                if (shotType == 1) {
                    player.getCurrentMatchResult().addShotsInteriorKo();
                } else if (shotType == 2) {
                    player.getCurrentMatchResult().addShotExteriorDoubleKo();
                } else {
                    player.getCurrentMatchResult().addShotExteriorTripleKo();
                }
                if (isFoul && shotType == 3) {
                    shotsFree = 3;
                } else if (isFoul) {
                    shotsFree = 2;
                }
                if (shotsFree == 0 && skillAttempt(76)) {
                    player = getRulete(4, teamAttack);
                    Player opponent4 = getRulete(4, teamDefense);
                    if (player != null && opponent4 != null && player.getSkillRebound().intValue() + player.getBaseMatchDefenseModifier().intValue() + getRandomValueGauss(0, 100) > opponent4.getSkillRebound().intValue() + opponent4.getBaseMatchDefenseModifier().intValue() + getRandomValueGauss(0, 100)) {
                        player.getCurrentMatchResult().addRebound();
                        if (loseManyPoints(match, teamAttack, teamDefense)) {
                            playPossession(pos, match, teamAttack, teamDefense);
                        }
                    } else if (opponent4 != null) {
                        opponent4.getCurrentMatchResult().addRebound();
                        if (loseManyPoints(match, teamDefense, teamAttack)) {
                            playPossession(pos, match, teamDefense, teamAttack);
                        }
                    }
                }
            }
            for (int i = 0; i < shotsFree; i++) {
                if (accomplishedAction(player.getSkillShotFree().intValue() + player.getBaseMatchAttackModifier().intValue(), 1.0f)) {
                    player.getCurrentMatchResult().addShotsFreeOk();
                } else {
                    player.getCurrentMatchResult().addShotsFreeKo();
                }
            }
        }
    }

    private static int getRandomValueGauss(Integer minValue, Integer maxValue) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(Util.getRandomValue(minValue, maxValue));
        list.add(Util.getRandomValue(minValue, maxValue));
        list.add(Util.getRandomValue(minValue, maxValue));
        Collections.sort(list);
        return list.get(1).intValue();
    }

    private static boolean loseManyPoints(Match match, Team teamThatGetsTheRebound, Team teamOther) {
        int averageTeamThatGetsTheRebound = BlankObj.toInteger(Double.valueOf(teamThatGetsTheRebound.getPlayersAverageTitulars().doubleValue() + teamThatGetsTheRebound.getPlayersAverageReserves().doubleValue())).intValue();
        int averageTeamOther = BlankObj.toInteger(Double.valueOf(teamOther.getPlayersAverageTitulars().doubleValue() + teamOther.getPlayersAverageReserves().doubleValue())).intValue();
        int difference = Math.abs(averageTeamThatGetsTheRebound - averageTeamOther) + 2;
        if (teamThatGetsTheRebound.getId().intValue() == match.getTeamLocal().getId().intValue()) {
            if (match.getTotalPointsLocalPlayers().intValue() + difference < match.getTotalPointsVisitorPlayers().intValue()) {
                return Boolean.TRUE.booleanValue();
            }
        } else if (match.getTotalPointsVisitorPlayers().intValue() + difference < match.getTotalPointsLocalPlayers().intValue()) {
            return Boolean.TRUE.booleanValue();
        }
        return Boolean.FALSE.booleanValue();
    }

    private void finishMatch(Match match) {
        int totalPoints;
        int totalPoints2;
        this.leagueList.add(match.getTeamLocal().getLeague());
        this.leagueList.add(match.getTeamVisitor().getLeague());
        List<Integer> localQuarters = getQuarters();
        if (match.getLocalExtension().intValue() > 0) {
            totalPoints = match.getLocalExtension().intValue();
            match.setLocalExtension(Integer.valueOf(match.getTotalPointsLocalPlayers().intValue() - totalPoints));
        } else {
            totalPoints = match.getTotalPointsLocalPlayers().intValue();
        }
        match.setLocalQuarterFirst(Integer.valueOf((localQuarters.get(0).intValue() * totalPoints) / 100));
        match.setLocalQuarterSecond(Integer.valueOf((localQuarters.get(1).intValue() * totalPoints) / 100));
        match.setLocalQuarterThird(Integer.valueOf((localQuarters.get(2).intValue() * totalPoints) / 100));
        match.setLocalQuarterFourth(Integer.valueOf(((totalPoints - match.getLocalQuarterFirst().intValue()) - match.getLocalQuarterSecond().intValue()) - match.getLocalQuarterThird().intValue()));
        List<Integer> visitorQuarters = getQuarters();
        if (match.getVisitorExtension().intValue() > 0) {
            totalPoints2 = match.getVisitorExtension().intValue();
            match.setVisitorExtension(Integer.valueOf(match.getTotalPointsVisitorPlayers().intValue() - totalPoints2));
        } else {
            totalPoints2 = match.getTotalPointsVisitorPlayers().intValue();
        }
        match.setVisitorQuarterFirst(Integer.valueOf((visitorQuarters.get(0).intValue() * totalPoints2) / 100));
        match.setVisitorQuarterSecond(Integer.valueOf((visitorQuarters.get(1).intValue() * totalPoints2) / 100));
        match.setVisitorQuarterThird(Integer.valueOf((visitorQuarters.get(2).intValue() * totalPoints2) / 100));
        match.setVisitorQuarterFourth(Integer.valueOf(((totalPoints2 - match.getVisitorQuarterFirst().intValue()) - match.getVisitorQuarterSecond().intValue()) - match.getVisitorQuarterThird().intValue()));
        int localBono = 0;
        int visitorBono = 0;
        if (167 > match.getMatchday().intValue()) {
            match.getTeamLocal().getLeague().setPointsScored(Integer.valueOf(match.getTeamLocal().getLeague().getPointsScored().intValue() + match.getFinalResultLocal().intValue()));
            match.getTeamVisitor().getLeague().setPointsAllowed(Integer.valueOf(match.getTeamVisitor().getLeague().getPointsAllowed().intValue() + match.getFinalResultLocal().intValue()));
            match.getTeamVisitor().getLeague().setPointsScored(Integer.valueOf(match.getTeamVisitor().getLeague().getPointsScored().intValue() + match.getFinalResultVisitor().intValue()));
            match.getTeamLocal().getLeague().setPointsAllowed(Integer.valueOf(match.getTeamLocal().getLeague().getPointsAllowed().intValue() + match.getFinalResultVisitor().intValue()));
            if (match.getFinalResultLocal().intValue() > match.getFinalResultVisitor().intValue()) {
                match.getTeamLocal().getLeague().setGamesWon(Integer.valueOf(match.getTeamLocal().getLeague().getGamesWon().intValue() + 1));
                match.getTeamVisitor().getLeague().setGamesLost(Integer.valueOf(match.getTeamVisitor().getLeague().getGamesLost().intValue() + 1));
                localBono = 1;
                visitorBono = -1;
            } else {
                match.getTeamVisitor().getLeague().setGamesWon(Integer.valueOf(match.getTeamVisitor().getLeague().getGamesWon().intValue() + 1));
                match.getTeamLocal().getLeague().setGamesLost(Integer.valueOf(match.getTeamLocal().getLeague().getGamesLost().intValue() + 1));
                localBono = -1;
                visitorBono = 1;
            }
        } else {
            Iterator<Playoffs> it = this.playoffsList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Playoffs playoffs = it.next();
                if (playoffs.getTeam().getId().intValue() == match.getTeamLocal().getId().intValue() && match.getFinalResultLocal().intValue() > match.getFinalResultVisitor().intValue()) {
                    playoffs.addSeriesGamesWon();
                    if (playoffs.getSeriesGamesWon().intValue() == 4 || playoffs.getSeriesGamesWon().intValue() == 8 || playoffs.getSeriesGamesWon().intValue() == 12) {
                        News news = createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_playoffs, R.string.news_playoffs_result_title, R.string.news_playoffs_result_body, match.getTeamLocal().getName(), match.getTeamVisitor().getName());
                        news.setTeam1(match.getTeamLocal());
                        news.setTeam2(match.getTeamVisitor());
                        if (playoffs.getSeriesGamesWon().intValue() == 12) {
                            for (Player player : match.getTeamLocal().getTactic().getPlayers()) {
                                player.setLoyalty(Util.getRandomValue(3, 5));
                            }
                        }
                    } else if (playoffs.getSeriesGamesWon().intValue() == 16) {
                        createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_trophy, R.string.news_playoffs_winner_title, R.string.news_playoffs_winner_body, match.getTeamLocal().getName()).setTeam1(match.getTeamLocal());
                        for (Player player2 : match.getTeamLocal().getTactic().getPlayers()) {
                            player2.setLoyalty(5);
                        }
                        for (Player player3 : match.getTeamVisitor().getTactic().getPlayers()) {
                            player3.setLoyalty(Util.getRandomValue(4, 5));
                        }
                        if (playoffs.getTeam().getId().intValue() == this.game.getUserTeam().getId().intValue()) {
                            ChallengesFragment.addChallenge(this.game);
                        }
                    }
                    localBono = 2;
                    visitorBono = -2;
                } else if (playoffs.getTeam().getId().intValue() == match.getTeamVisitor().getId().intValue() && match.getFinalResultLocal().intValue() < match.getFinalResultVisitor().intValue()) {
                    playoffs.addSeriesGamesWon();
                    if (playoffs.getSeriesGamesWon().intValue() == 4 || playoffs.getSeriesGamesWon().intValue() == 8 || playoffs.getSeriesGamesWon().intValue() == 12) {
                        News news2 = createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_playoffs, R.string.news_playoffs_result_title, R.string.news_playoffs_result_body, match.getTeamVisitor().getName(), match.getTeamLocal().getName());
                        news2.setTeam1(match.getTeamVisitor());
                        news2.setTeam2(match.getTeamLocal());
                        if (playoffs.getSeriesGamesWon().intValue() == 12) {
                            for (Player player4 : match.getTeamVisitor().getTactic().getPlayers()) {
                                player4.setLoyalty(Util.getRandomValue(3, 5));
                            }
                        }
                    } else if (playoffs.getSeriesGamesWon().intValue() == 16) {
                        createNewsAndAdd(match.getMatchday().intValue(), R.drawable.news_trophy, R.string.news_playoffs_winner_title, R.string.news_playoffs_winner_body, match.getTeamVisitor().getName()).setTeam1(match.getTeamVisitor());
                        for (Player player5 : match.getTeamVisitor().getTactic().getPlayers()) {
                            player5.setLoyalty(5);
                        }
                        for (Player player6 : match.getTeamLocal().getTactic().getPlayers()) {
                            player6.setLoyalty(Util.getRandomValue(4, 5));
                        }
                        if (playoffs.getTeam().getId().intValue() == this.game.getUserTeam().getId().intValue()) {
                            ChallengesFragment.addChallenge(this.game);
                        }
                    }
                    localBono = -2;
                    visitorBono = 2;
                }
            }
        }
        updateFormAndEnergy(match.getTeamLocal(), localBono);
        updateFormAndEnergy(match.getTeamVisitor(), visitorBono);
    }

    private void updateFormAndEnergy(Team team, int bono) {
        int benchImportance = team.getTactic().getTacticBenchImportance().intValue();
        for (Player player : team.getTactic().getPlayers()) {
            if (player.getIsTitular().booleanValue()) {
                player.setStateForm(Integer.valueOf(player.getStateForm().intValue() + Util.getRandomValue(Integer.valueOf(6 - benchImportance), Integer.valueOf(11 - benchImportance)).intValue()));
                player.setStateEnergy(Integer.valueOf(player.getStateEnergy().intValue() - Util.getRandomValue(Integer.valueOf(7 - benchImportance), Integer.valueOf(12 - benchImportance)).intValue()));
            } else if (player.getIsReserve().booleanValue()) {
                player.setStateForm(Integer.valueOf(player.getStateForm().intValue() + Util.getRandomValue(Integer.valueOf(benchImportance - 5), Integer.valueOf(benchImportance + 0)).intValue()));
                player.setStateEnergy(Integer.valueOf(player.getStateEnergy().intValue() - Util.getRandomValue(Integer.valueOf(benchImportance - 2), Integer.valueOf(benchImportance + 3)).intValue()));
            } else {
                player.setStateForm(Integer.valueOf(player.getStateForm().intValue() - Util.getRandomValue(-1, Integer.valueOf(player.getStateForm().intValue() / 10)).intValue()));
                player.setStateEnergy(Integer.valueOf(player.getStateEnergy().intValue() + Util.getRandomValue(1, Integer.valueOf((100 - player.getStateEnergy().intValue()) / 4)).intValue()));
            }
        }
    }

    private List<Player> calculateNewStateOfAllPlayers() {
        Player filter = new Player(this.game.getContext());
        filter.setGame(this.game);
        List<Player> allPlayersList = BlankDao.getSome(filter);
        for (Player player : allPlayersList) {
            if (player.getStateInjury().intValue() < 0) {
                player.setStateInjury(0);
            } else if (player.getStateInjury().intValue() > 0) {
                player.setStateInjury(Integer.valueOf(player.getStateInjury().intValue() - 1));
                player.setStateForm(Integer.valueOf(player.getStateForm().intValue() - Util.getRandomValue(0, 3).intValue()));
                if (player.getStateInjury().intValue() == 0 && player.getTeam().getId() != null && player.getTeam().getId().intValue() == this.game.getUserTeam().getId().intValue()) {
                    News news = createNewsAndAdd(this.game.getCurrentMatchday().intValue(), R.drawable.news_recovery, R.string.news_player_recovery_title, R.string.news_player_recovery_body, player.getShortName());
                    news.setPlayer1(player);
                }
            }
            player.setStateForm(Integer.valueOf(player.getStateForm().intValue() + Util.getRandomValue(-17, 15).intValue() + Util.getRandomValue(0, Integer.valueOf((100 - player.getStateForm().intValue()) / 20)).intValue()));
            player.setStateEnergy(Integer.valueOf(player.getStateEnergy().intValue() + Util.getRandomValue(-3, 8).intValue() + Util.getRandomValue(0, Integer.valueOf((100 - player.getStateEnergy().intValue()) / 20)).intValue()));
        }
        return allPlayersList;
    }

    private void calculateMinutes(Match match, boolean isLocal) {
        Integer benchImportance;
        Integer auxImportance;
        List<Player> listTitulars;
        List<Player> listReserves;
        if (isLocal) {
            benchImportance = match.getTeamLocal().getTactic().getTacticBenchImportance();
            auxImportance = Integer.valueOf(benchImportance.intValue() - 1);
            listTitulars = match.getTeamLocal().getTactic().getPlayersTitulars();
            listReserves = match.getTeamLocal().getTactic().getPlayersReserves();
        } else {
            benchImportance = match.getTeamVisitor().getTactic().getTacticBenchImportance();
            auxImportance = Integer.valueOf(benchImportance.intValue() - 1);
            listTitulars = match.getTeamVisitor().getTactic().getPlayersTitulars();
            listReserves = match.getTeamVisitor().getTactic().getPlayersReserves();
        }
        for (int i = 0; i < 5; i++) {
            Player playerTitular = listTitulars.get(i);
            Player auxPlayerReserve = listReserves.get(i);
            Integer reserveMinutes = Integer.valueOf(benchImportance.intValue() + Util.getRandomValue(Integer.valueOf(auxImportance.intValue() * 4), Integer.valueOf(benchImportance.intValue() * 4)).intValue());
            if (playerTitular.getCurrentMatchResult() != null) {
                playerTitular.getCurrentMatchResult().setMinutesPlayed(Integer.valueOf(48 - reserveMinutes.intValue()));
            }
            if (auxPlayerReserve.getCurrentMatchResult() != null) {
                auxPlayerReserve.getCurrentMatchResult().setMinutesPlayed(reserveMinutes);
            }
        }
    }

    private boolean skillAttempt(int attempt) {
        int random = Util.getRandomValue(0, 100).intValue();
        return random <= attempt;
    }

    private boolean accomplishedAction(int skill, float modifier) {
        int random = Util.getRandomValue(0, 100).intValue();
        if (random == 0) {
            return Boolean.TRUE.booleanValue();
        }
        if (random == 100) {
            return Boolean.FALSE.booleanValue();
        }
        return ((float) random) <= ((float) skill) * modifier;
    }

    private Player getRulete(Integer ruleteSkill, Team team) {
        return this.rulete.getRulete(ruleteSkill, team);
    }

    private static List<Integer> getQuarters() {
        int random = Util.getRandomValue(1, 3).intValue();
        List<Integer> list = new ArrayList<>();
        if (random == 1) {
            list.add(21);
            list.add(24);
            list.add(29);
        } else if (random == 2) {
            list.add(17);
            list.add(24);
            list.add(28);
        } else if (random == 3) {
            list.add(22);
            list.add(26);
            list.add(33);
        }
        Collections.shuffle(list);
        return list;
    }

    private News createNewsAndAdd(int matchday, int type, int title, int body, Object... objects) {
        News news = new News(this.game.getContext());
        news.setGame(this.game);
        news.setMatchday(Integer.valueOf(matchday));
        news.setType(Integer.valueOf(type));
        news.setTitle(this.game.getContext().getString(title));
        news.setBody(String.format(this.game.getContext().getString(body), objects));
        this.newsList.add(news);
        return news;
    }
}
