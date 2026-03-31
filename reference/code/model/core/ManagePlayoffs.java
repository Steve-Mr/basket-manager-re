package com.blank.bm15.model.core;

import com.blank.bm15.activity.fragment.ClassificationTotalFragment;
import com.blank.bm15.activity.fragment.RookiesStatisticsFragment;
import com.blank.bm15.activity.fragment.Top100StatisticsFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.object.other.MatchdayCalendar;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class ManagePlayoffs {
    public static void manage(Game game) {
        if (167 == game.getCurrentMatchday().intValue()) {
            List<Classification> eastClassificationList = ClassificationTotalFragment.getClassification(game, 1);
            List<Classification> westClassificationList = ClassificationTotalFragment.getClassification(game, 2);
            List<Playoffs> playoffsList = new ArrayList<>();
            List<News> newsList = new ArrayList<>();
            List<Player> playerList = new ArrayList<>();
            int east = 1;
            int west = 1;
            String playoffsNewsTeamEast = "\n";
            String playoffsNewsTeamWest = "\n";
            int i = 0;
            while (true) {
                int west2 = west;
                int east2 = east;
                if (i >= 15) {
                    break;
                }
                Classification auxEast = eastClassificationList.get(i);
                Classification auxWest = westClassificationList.get(i);
                if (auxEast.getIsClassified().booleanValue()) {
                    playoffsList.add(createPlayoff(game, auxEast, east2));
                    east = east2 + 1;
                    playoffsNewsTeamEast = String.valueOf(playoffsNewsTeamEast) + east2 + " " + auxEast.getName() + ".\n";
                    for (Player player : auxEast.getTeam().getTactic().getPlayers()) {
                        player.setLoyalty(Util.getRandomValue(2, 5));
                        playerList.add(player);
                    }
                } else {
                    for (Player player2 : auxEast.getTeam().getTactic().getPlayers()) {
                        player2.setLoyalty(Util.getRandomValue(1, 4));
                        playerList.add(player2);
                    }
                    east = east2;
                }
                if (auxWest.getIsClassified().booleanValue()) {
                    playoffsList.add(createPlayoff(game, auxWest, west2));
                    west = west2 + 1;
                    playoffsNewsTeamWest = String.valueOf(playoffsNewsTeamWest) + west2 + " " + auxWest.getName() + ".\n";
                    for (Player player3 : auxEast.getTeam().getTactic().getPlayers()) {
                        player3.setLoyalty(Util.getRandomValue(2, 5));
                        playerList.add(player3);
                    }
                } else {
                    for (Player player4 : auxEast.getTeam().getTactic().getPlayers()) {
                        player4.setLoyalty(Util.getRandomValue(1, 4));
                        playerList.add(player4);
                    }
                    west = west2;
                }
                i++;
            }
            BlankDao.saveOrUpdateAll(playoffsList);
            BlankDao.saveOrUpdateAll(playerList);
            createNewsAndAdd(newsList, game, game.getCurrentMatchday().intValue(), R.drawable.news_playoffs, R.string.news_playoffs_east_title, R.string.news_playoffs_east_body, playoffsNewsTeamEast);
            createNewsAndAdd(newsList, game, game.getCurrentMatchday().intValue(), R.drawable.news_playoffs, R.string.news_playoffs_west_title, R.string.news_playoffs_west_body, playoffsNewsTeamWest);
            createNewsAndAdd(newsList, game, game.getCurrentMatchday().intValue(), R.drawable.news_trophy, R.string.news_player_of_league_title, R.string.news_player_of_league_body, Top100StatisticsFragment.getPlayerOfYearNewsBody(game));
            createNewsAndAdd(newsList, game, game.getCurrentMatchday().intValue(), R.drawable.news_trophy, R.string.news_player_of_league_rookie_title, R.string.news_player_of_league_rookie_body, RookiesStatisticsFragment.getRookieOfYearNewsBody(game));
            BlankDao.saveOrUpdateAll(newsList);
        }
        if (167 <= game.getCurrentMatchday().intValue()) {
            createPlayoffsMatches(game);
            removeUnnecessaryPlayoffsMatches(game);
        }
    }

    private static Playoffs createPlayoff(Game game, Classification classification, int position) {
        Playoffs playoffs = new Playoffs(game.getContext());
        playoffs.getTeam().setId(classification.getTeam().getId());
        playoffs.setPosition(Integer.valueOf(position));
        playoffs.setGamesWon(classification.getTeam().getLeague().getGamesWon());
        playoffs.setConference(classification.getConference());
        playoffs.setPointsDiff(Integer.valueOf(classification.getPointsScored().intValue() - classification.getPointsAllowed().intValue()));
        playoffs.setPointsScored(classification.getTeam().getLeague().getPointsScored());
        playoffs.setGame(game);
        return playoffs;
    }

    private static void removeUnnecessaryPlayoffsMatches(Game game) {
        int gamesWon = 0;
        if (game.getCurrentMatchday().intValue() < 182) {
            gamesWon = 4;
        } else if (game.getCurrentMatchday().intValue() < 197) {
            gamesWon = 8;
        } else if (game.getCurrentMatchday().intValue() < 212) {
            gamesWon = 12;
        } else if (game.getCurrentMatchday().intValue() < 234) {
            gamesWon = 16;
        }
        if (gamesWon > 0) {
            Playoffs filter = new Playoffs(game.getContext());
            filter.setGame(game);
            filter.setSeriesGamesWon(Integer.valueOf(gamesWon));
            List<Playoffs> playoffsList = BlankDao.getSome(filter);
            for (Playoffs playoffs : playoffsList) {
                List<Match> matchList = BlankDaoExtra.getMatchesToDeleteByPlayoffs(playoffs);
                if (!matchList.isEmpty()) {
                    BlankDao.deleteAll(matchList);
                }
            }
        }
    }

    private static void createPlayoffsMatches(Game game) {
        Team filter = new Team(game.getContext());
        filter.setGame(game);
        List<Team> teamList = BlankDao.getSome(filter);
        List<Match> matchList = new ArrayList<>();
        List<MatchdayCalendar> list = new ArrayList<>();
        if (game.getCurrentMatchday().intValue() == 167) {
            list = getPlayoffsSeriesQuarters(game);
        } else if (game.getCurrentMatchday().intValue() == 182) {
            list = getPlayoffsSeriesSemis(game);
        } else if (game.getCurrentMatchday().intValue() == 197) {
            list = getPlayoffsSeriesConference(game);
        } else if (game.getCurrentMatchday().intValue() == 212) {
            list = getPlayoffsSeriesFinal(game);
        }
        for (MatchdayCalendar matchdayCalendar : list) {
            Match match = new Match(game.getContext());
            match.setMatchday(matchdayCalendar.getMatchday());
            match.setGame(game);
            match.setTeamLocal(findTeam(teamList, matchdayCalendar.getTeamLocal()));
            match.setTeamVisitor(findTeam(teamList, matchdayCalendar.getTeamVisitor()));
            matchList.add(match);
        }
        BlankDao.saveOrUpdateAll(matchList);
    }

    private static List<MatchdayCalendar> getPlayoffsSeriesQuarters(Game game) {
        List<MatchdayCalendar> list = new ArrayList<>();
        Playoffs filter = new Playoffs(game.getContext());
        filter.setGame(game);
        List<Playoffs> playoffsList = BlankDao.getSome(filter);
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 != null && eastTeam2 != null && eastTeam3 != null && eastTeam4 != null && eastTeam5 != null && eastTeam6 != null && eastTeam7 != null && eastTeam8 != null && westTeam1 != null && westTeam2 != null && westTeam3 != null && westTeam4 != null && westTeam5 != null && westTeam6 != null && westTeam7 != null && westTeam8 != null) {
            list.add(new MatchdayCalendar(168, eastTeam1, eastTeam8, Boolean.TRUE));
            list.add(new MatchdayCalendar(168, eastTeam2, eastTeam7, Boolean.TRUE));
            list.add(new MatchdayCalendar(168, westTeam1, westTeam8, Boolean.TRUE));
            list.add(new MatchdayCalendar(168, westTeam2, westTeam7, Boolean.TRUE));
            list.add(new MatchdayCalendar(169, eastTeam3, eastTeam6, Boolean.TRUE));
            list.add(new MatchdayCalendar(169, eastTeam4, eastTeam5, Boolean.TRUE));
            list.add(new MatchdayCalendar(169, westTeam3, westTeam6, Boolean.TRUE));
            list.add(new MatchdayCalendar(169, westTeam4, westTeam5, Boolean.TRUE));
            list.add(new MatchdayCalendar(170, eastTeam1, eastTeam8, Boolean.TRUE));
            list.add(new MatchdayCalendar(170, eastTeam2, eastTeam7, Boolean.TRUE));
            list.add(new MatchdayCalendar(170, westTeam1, westTeam8, Boolean.TRUE));
            list.add(new MatchdayCalendar(170, westTeam2, westTeam7, Boolean.TRUE));
            list.add(new MatchdayCalendar(171, eastTeam3, eastTeam6, Boolean.TRUE));
            list.add(new MatchdayCalendar(171, eastTeam4, eastTeam5, Boolean.TRUE));
            list.add(new MatchdayCalendar(171, westTeam3, westTeam6, Boolean.TRUE));
            list.add(new MatchdayCalendar(171, westTeam4, westTeam5, Boolean.TRUE));
            list.add(new MatchdayCalendar(172, eastTeam8, eastTeam1, Boolean.FALSE));
            list.add(new MatchdayCalendar(172, eastTeam7, eastTeam2, Boolean.FALSE));
            list.add(new MatchdayCalendar(172, westTeam8, westTeam1, Boolean.FALSE));
            list.add(new MatchdayCalendar(172, westTeam7, westTeam2, Boolean.FALSE));
            list.add(new MatchdayCalendar(173, eastTeam6, eastTeam3, Boolean.FALSE));
            list.add(new MatchdayCalendar(173, eastTeam5, eastTeam4, Boolean.FALSE));
            list.add(new MatchdayCalendar(173, westTeam6, westTeam3, Boolean.FALSE));
            list.add(new MatchdayCalendar(173, westTeam5, westTeam4, Boolean.FALSE));
            list.add(new MatchdayCalendar(174, eastTeam8, eastTeam1, Boolean.FALSE));
            list.add(new MatchdayCalendar(174, eastTeam7, eastTeam2, Boolean.FALSE));
            list.add(new MatchdayCalendar(174, westTeam8, westTeam1, Boolean.FALSE));
            list.add(new MatchdayCalendar(174, westTeam7, westTeam2, Boolean.FALSE));
            list.add(new MatchdayCalendar(175, eastTeam6, eastTeam3, Boolean.FALSE));
            list.add(new MatchdayCalendar(175, eastTeam5, eastTeam4, Boolean.FALSE));
            list.add(new MatchdayCalendar(175, westTeam6, westTeam3, Boolean.FALSE));
            list.add(new MatchdayCalendar(175, westTeam5, westTeam4, Boolean.FALSE));
            if (!eastTeam1.getIsInSeriesSemis().booleanValue() && !eastTeam8.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(176, eastTeam8, eastTeam1, Boolean.FALSE));
            }
            if (!eastTeam2.getIsInSeriesSemis().booleanValue() && !eastTeam7.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(176, eastTeam7, eastTeam2, Boolean.FALSE));
            }
            if (!westTeam1.getIsInSeriesSemis().booleanValue() && !westTeam8.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(176, westTeam8, westTeam1, Boolean.FALSE));
            }
            if (!westTeam2.getIsInSeriesSemis().booleanValue() && !westTeam7.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(176, westTeam7, westTeam2, Boolean.FALSE));
            }
            if (!eastTeam3.getIsInSeriesSemis().booleanValue() && !eastTeam6.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(177, eastTeam6, eastTeam3, Boolean.FALSE));
            }
            if (!eastTeam4.getIsInSeriesSemis().booleanValue() && !eastTeam5.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(177, eastTeam5, eastTeam4, Boolean.FALSE));
            }
            if (!westTeam3.getIsInSeriesSemis().booleanValue() && !westTeam6.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(177, westTeam6, westTeam3, Boolean.FALSE));
            }
            if (!westTeam4.getIsInSeriesSemis().booleanValue() && !westTeam5.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(177, westTeam5, westTeam4, Boolean.FALSE));
            }
            if (!eastTeam1.getIsInSeriesSemis().booleanValue() && !eastTeam8.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(178, eastTeam1, eastTeam8, Boolean.TRUE));
            }
            if (!eastTeam2.getIsInSeriesSemis().booleanValue() && !eastTeam7.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(178, eastTeam2, eastTeam7, Boolean.TRUE));
            }
            if (!westTeam1.getIsInSeriesSemis().booleanValue() && !westTeam8.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(178, westTeam1, westTeam8, Boolean.TRUE));
            }
            if (!westTeam2.getIsInSeriesSemis().booleanValue() && !westTeam7.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(178, westTeam2, westTeam7, Boolean.TRUE));
            }
            if (!eastTeam3.getIsInSeriesSemis().booleanValue() && !eastTeam6.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(179, eastTeam3, eastTeam6, Boolean.TRUE));
            }
            if (!eastTeam4.getIsInSeriesSemis().booleanValue() && !eastTeam5.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(179, eastTeam4, eastTeam5, Boolean.TRUE));
            }
            if (!westTeam3.getIsInSeriesSemis().booleanValue() && !westTeam6.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(179, westTeam3, westTeam6, Boolean.TRUE));
            }
            if (!westTeam4.getIsInSeriesSemis().booleanValue() && !westTeam5.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(179, westTeam4, westTeam5, Boolean.TRUE));
            }
            if (!eastTeam1.getIsInSeriesSemis().booleanValue() && !eastTeam8.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(180, eastTeam1, eastTeam8, Boolean.TRUE));
            }
            if (!eastTeam2.getIsInSeriesSemis().booleanValue() && !eastTeam7.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(180, eastTeam2, eastTeam7, Boolean.TRUE));
            }
            if (!westTeam1.getIsInSeriesSemis().booleanValue() && !westTeam8.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(180, westTeam1, westTeam8, Boolean.TRUE));
            }
            if (!westTeam2.getIsInSeriesSemis().booleanValue() && !westTeam7.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(180, westTeam2, westTeam7, Boolean.TRUE));
            }
            if (!eastTeam3.getIsInSeriesSemis().booleanValue() && !eastTeam6.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(181, eastTeam3, eastTeam6, Boolean.TRUE));
            }
            if (!eastTeam4.getIsInSeriesSemis().booleanValue() && !eastTeam5.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(181, eastTeam4, eastTeam5, Boolean.TRUE));
            }
            if (!westTeam3.getIsInSeriesSemis().booleanValue() && !westTeam6.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(181, westTeam3, westTeam6, Boolean.TRUE));
            }
            if (!westTeam4.getIsInSeriesSemis().booleanValue() && !westTeam5.getIsInSeriesSemis().booleanValue()) {
                list.add(new MatchdayCalendar(181, westTeam4, westTeam5, Boolean.TRUE));
            }
        }
        return list;
    }

    private static List<MatchdayCalendar> getPlayoffsSeriesSemis(Game game) {
        Playoffs eastSemis18;
        Playoffs eastSemis27;
        Playoffs eastSemis36;
        Playoffs eastSemis45;
        Playoffs westSemis18;
        Playoffs westSemis27;
        Playoffs westSemis36;
        Playoffs westSemis45;
        List<MatchdayCalendar> list = new ArrayList<>();
        Playoffs filter = new Playoffs(game.getContext());
        filter.setGame(game);
        List<Playoffs> playoffsList = BlankDao.getSome(filter);
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 == null || !eastTeam1.getIsInSeriesSemis().booleanValue()) {
            eastSemis18 = (eastTeam8 == null || !eastTeam8.getIsInSeriesSemis().booleanValue()) ? null : eastTeam8;
        } else {
            eastSemis18 = eastTeam1;
        }
        if (eastTeam2 == null || !eastTeam2.getIsInSeriesSemis().booleanValue()) {
            eastSemis27 = (eastTeam7 == null || !eastTeam7.getIsInSeriesSemis().booleanValue()) ? null : eastTeam7;
        } else {
            eastSemis27 = eastTeam2;
        }
        if (eastTeam3 == null || !eastTeam3.getIsInSeriesSemis().booleanValue()) {
            eastSemis36 = (eastTeam6 == null || !eastTeam6.getIsInSeriesSemis().booleanValue()) ? null : eastTeam6;
        } else {
            eastSemis36 = eastTeam3;
        }
        if (eastTeam4 == null || !eastTeam4.getIsInSeriesSemis().booleanValue()) {
            eastSemis45 = (eastTeam5 == null || !eastTeam5.getIsInSeriesSemis().booleanValue()) ? null : eastTeam5;
        } else {
            eastSemis45 = eastTeam4;
        }
        if (westTeam1 == null || !westTeam1.getIsInSeriesSemis().booleanValue()) {
            westSemis18 = (westTeam8 == null || !westTeam8.getIsInSeriesSemis().booleanValue()) ? null : westTeam8;
        } else {
            westSemis18 = westTeam1;
        }
        if (westTeam2 == null || !westTeam2.getIsInSeriesSemis().booleanValue()) {
            westSemis27 = (westTeam7 == null || !westTeam7.getIsInSeriesSemis().booleanValue()) ? null : westTeam7;
        } else {
            westSemis27 = westTeam2;
        }
        if (westTeam3 == null || !westTeam3.getIsInSeriesSemis().booleanValue()) {
            westSemis36 = (westTeam6 == null || !westTeam6.getIsInSeriesSemis().booleanValue()) ? null : westTeam6;
        } else {
            westSemis36 = westTeam3;
        }
        if (westTeam4 == null || !westTeam4.getIsInSeriesSemis().booleanValue()) {
            westSemis45 = (westTeam5 == null || !westTeam5.getIsInSeriesSemis().booleanValue()) ? null : westTeam5;
        } else {
            westSemis45 = westTeam4;
        }
        if (eastSemis18 != null && eastSemis27 != null && eastSemis36 != null && eastSemis45 != null && westSemis18 != null && westSemis27 != null && westSemis36 != null && westSemis45 != null) {
            list.add(new MatchdayCalendar(183, eastSemis18, eastSemis45, Boolean.TRUE));
            list.add(new MatchdayCalendar(183, eastSemis27, eastSemis36, Boolean.TRUE));
            list.add(new MatchdayCalendar(184, westSemis18, westSemis45, Boolean.TRUE));
            list.add(new MatchdayCalendar(184, westSemis27, westSemis36, Boolean.TRUE));
            list.add(new MatchdayCalendar(185, eastSemis18, eastSemis45, Boolean.TRUE));
            list.add(new MatchdayCalendar(185, eastSemis27, eastSemis36, Boolean.TRUE));
            list.add(new MatchdayCalendar(186, westSemis18, westSemis45, Boolean.TRUE));
            list.add(new MatchdayCalendar(186, westSemis27, westSemis36, Boolean.TRUE));
            list.add(new MatchdayCalendar(187, eastSemis45, eastSemis18, Boolean.FALSE));
            list.add(new MatchdayCalendar(187, eastSemis36, eastSemis27, Boolean.FALSE));
            list.add(new MatchdayCalendar(188, westSemis45, westSemis18, Boolean.FALSE));
            list.add(new MatchdayCalendar(188, westSemis36, westSemis27, Boolean.FALSE));
            list.add(new MatchdayCalendar(189, eastSemis45, eastSemis18, Boolean.FALSE));
            list.add(new MatchdayCalendar(189, eastSemis36, eastSemis27, Boolean.FALSE));
            list.add(new MatchdayCalendar(190, westSemis45, westSemis18, Boolean.FALSE));
            list.add(new MatchdayCalendar(190, westSemis36, westSemis27, Boolean.FALSE));
            if (!eastSemis18.getIsInSeriesConferenceFinal().booleanValue() && !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(191, eastSemis45, eastSemis18, Boolean.FALSE));
            }
            if (!eastSemis27.getIsInSeriesConferenceFinal().booleanValue() && !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(191, eastSemis36, eastSemis27, Boolean.FALSE));
            }
            if (!westSemis18.getIsInSeriesConferenceFinal().booleanValue() && !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(192, westSemis45, westSemis18, Boolean.FALSE));
            }
            if (!westSemis27.getIsInSeriesConferenceFinal().booleanValue() && !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(192, westSemis36, westSemis27, Boolean.FALSE));
            }
            if (!eastSemis18.getIsInSeriesConferenceFinal().booleanValue() && !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(193, eastSemis18, eastSemis45, Boolean.TRUE));
            }
            if (!eastSemis27.getIsInSeriesConferenceFinal().booleanValue() && !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(193, eastSemis27, eastSemis36, Boolean.TRUE));
            }
            if (!westSemis18.getIsInSeriesConferenceFinal().booleanValue() && !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(194, westSemis18, westSemis45, Boolean.TRUE));
            }
            if (!westSemis27.getIsInSeriesConferenceFinal().booleanValue() && !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(194, westSemis27, westSemis36, Boolean.TRUE));
            }
            if (!eastSemis18.getIsInSeriesConferenceFinal().booleanValue() && !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(195, eastSemis18, eastSemis45, Boolean.TRUE));
            }
            if (!eastSemis27.getIsInSeriesConferenceFinal().booleanValue() && !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(195, eastSemis27, eastSemis36, Boolean.TRUE));
            }
            if (!westSemis18.getIsInSeriesConferenceFinal().booleanValue() && !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(196, westSemis18, westSemis45, Boolean.TRUE));
            }
            if (!westSemis27.getIsInSeriesConferenceFinal().booleanValue() && !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) {
                list.add(new MatchdayCalendar(196, westSemis27, westSemis36, Boolean.TRUE));
            }
        }
        return list;
    }

    private static List<MatchdayCalendar> getPlayoffsSeriesConference(Game game) {
        Playoffs eastSemis18;
        Playoffs eastSemis27;
        Playoffs eastSemis36;
        Playoffs eastSemis45;
        Playoffs westSemis18;
        Playoffs westSemis27;
        Playoffs westSemis36;
        Playoffs westSemis45;
        Playoffs eastSemis1845;
        Playoffs eastSemis2736;
        Playoffs westSemis1845;
        Playoffs westSemis2736;
        List<MatchdayCalendar> list = new ArrayList<>();
        Playoffs filter = new Playoffs(game.getContext());
        filter.setGame(game);
        List<Playoffs> playoffsList = BlankDao.getSome(filter);
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 == null || !eastTeam1.getIsInSeriesSemis().booleanValue()) {
            eastSemis18 = (eastTeam8 == null || !eastTeam8.getIsInSeriesSemis().booleanValue()) ? null : eastTeam8;
        } else {
            eastSemis18 = eastTeam1;
        }
        if (eastTeam2 == null || !eastTeam2.getIsInSeriesSemis().booleanValue()) {
            eastSemis27 = (eastTeam7 == null || !eastTeam7.getIsInSeriesSemis().booleanValue()) ? null : eastTeam7;
        } else {
            eastSemis27 = eastTeam2;
        }
        if (eastTeam3 == null || !eastTeam3.getIsInSeriesSemis().booleanValue()) {
            eastSemis36 = (eastTeam6 == null || !eastTeam6.getIsInSeriesSemis().booleanValue()) ? null : eastTeam6;
        } else {
            eastSemis36 = eastTeam3;
        }
        if (eastTeam4 == null || !eastTeam4.getIsInSeriesSemis().booleanValue()) {
            eastSemis45 = (eastTeam5 == null || !eastTeam5.getIsInSeriesSemis().booleanValue()) ? null : eastTeam5;
        } else {
            eastSemis45 = eastTeam4;
        }
        if (westTeam1 == null || !westTeam1.getIsInSeriesSemis().booleanValue()) {
            westSemis18 = (westTeam8 == null || !westTeam8.getIsInSeriesSemis().booleanValue()) ? null : westTeam8;
        } else {
            westSemis18 = westTeam1;
        }
        if (westTeam2 == null || !westTeam2.getIsInSeriesSemis().booleanValue()) {
            westSemis27 = (westTeam7 == null || !westTeam7.getIsInSeriesSemis().booleanValue()) ? null : westTeam7;
        } else {
            westSemis27 = westTeam2;
        }
        if (westTeam3 == null || !westTeam3.getIsInSeriesSemis().booleanValue()) {
            westSemis36 = (westTeam6 == null || !westTeam6.getIsInSeriesSemis().booleanValue()) ? null : westTeam6;
        } else {
            westSemis36 = westTeam3;
        }
        if (westTeam4 == null || !westTeam4.getIsInSeriesSemis().booleanValue()) {
            westSemis45 = (westTeam5 == null || !westTeam5.getIsInSeriesSemis().booleanValue()) ? null : westTeam5;
        } else {
            westSemis45 = westTeam4;
        }
        if (eastSemis18 == null || !eastSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis1845 = (eastSemis45 == null || !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis45;
        } else {
            eastSemis1845 = eastSemis18;
        }
        if (eastSemis27 == null || !eastSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis2736 = (eastSemis36 == null || !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis36;
        } else {
            eastSemis2736 = eastSemis27;
        }
        if (westSemis18 == null || !westSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis1845 = (westSemis45 == null || !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis45;
        } else {
            westSemis1845 = westSemis18;
        }
        if (westSemis27 == null || !westSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis2736 = (westSemis36 == null || !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis36;
        } else {
            westSemis2736 = westSemis27;
        }
        if (eastSemis1845 != null && eastSemis1845 != null && westSemis1845 != null && westSemis2736 != null) {
            list.add(new MatchdayCalendar(198, eastSemis1845, eastSemis2736, Boolean.TRUE));
            list.add(new MatchdayCalendar(199, westSemis1845, westSemis2736, Boolean.TRUE));
            list.add(new MatchdayCalendar(200, eastSemis1845, eastSemis2736, Boolean.TRUE));
            list.add(new MatchdayCalendar(201, westSemis1845, westSemis2736, Boolean.TRUE));
            list.add(new MatchdayCalendar(202, eastSemis2736, eastSemis1845, Boolean.FALSE));
            list.add(new MatchdayCalendar(203, westSemis2736, westSemis1845, Boolean.FALSE));
            list.add(new MatchdayCalendar(204, eastSemis2736, eastSemis1845, Boolean.FALSE));
            list.add(new MatchdayCalendar(205, westSemis2736, westSemis1845, Boolean.FALSE));
            if (!eastSemis1845.getIsInSeriesWorldFinal().booleanValue() && !eastSemis2736.getIsInSeriesWorldFinal().booleanValue()) {
                list.add(new MatchdayCalendar(206, eastSemis2736, eastSemis1845, Boolean.FALSE));
            }
            if (!westSemis1845.getIsInSeriesWorldFinal().booleanValue() && !westSemis2736.getIsInSeriesWorldFinal().booleanValue()) {
                list.add(new MatchdayCalendar(207, westSemis2736, westSemis1845, Boolean.FALSE));
            }
            if (!eastSemis1845.getIsInSeriesWorldFinal().booleanValue() && !eastSemis2736.getIsInSeriesWorldFinal().booleanValue()) {
                list.add(new MatchdayCalendar(208, eastSemis1845, eastSemis2736, Boolean.TRUE));
            }
            if (!westSemis1845.getIsInSeriesWorldFinal().booleanValue() && !westSemis2736.getIsInSeriesWorldFinal().booleanValue()) {
                list.add(new MatchdayCalendar(209, westSemis1845, westSemis2736, Boolean.TRUE));
            }
            if (!eastSemis1845.getIsInSeriesWorldFinal().booleanValue() && !eastSemis2736.getIsInSeriesWorldFinal().booleanValue()) {
                list.add(new MatchdayCalendar(210, eastSemis1845, eastSemis2736, Boolean.TRUE));
            }
            if (!westSemis1845.getIsInSeriesWorldFinal().booleanValue() && !westSemis2736.getIsInSeriesWorldFinal().booleanValue()) {
                list.add(new MatchdayCalendar(211, westSemis1845, westSemis2736, Boolean.TRUE));
            }
        }
        return list;
    }

    public static List<MatchdayCalendar> getPlayoffsSeriesFinal(Game game) {
        Playoffs eastSemis18;
        Playoffs eastSemis27;
        Playoffs eastSemis36;
        Playoffs eastSemis45;
        Playoffs westSemis18;
        Playoffs westSemis27;
        Playoffs westSemis36;
        Playoffs westSemis45;
        Playoffs eastSemis1845;
        Playoffs eastSemis2736;
        Playoffs westSemis1845;
        Playoffs westSemis2736;
        Playoffs eastConference;
        Playoffs westConference;
        List<MatchdayCalendar> list = new ArrayList<>();
        Playoffs filter = new Playoffs(game.getContext());
        filter.setGame(game);
        List<Playoffs> playoffsList = BlankDao.getSome(filter);
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 == null || !eastTeam1.getIsInSeriesSemis().booleanValue()) {
            eastSemis18 = (eastTeam8 == null || !eastTeam8.getIsInSeriesSemis().booleanValue()) ? null : eastTeam8;
        } else {
            eastSemis18 = eastTeam1;
        }
        if (eastTeam2 == null || !eastTeam2.getIsInSeriesSemis().booleanValue()) {
            eastSemis27 = (eastTeam7 == null || !eastTeam7.getIsInSeriesSemis().booleanValue()) ? null : eastTeam7;
        } else {
            eastSemis27 = eastTeam2;
        }
        if (eastTeam3 == null || !eastTeam3.getIsInSeriesSemis().booleanValue()) {
            eastSemis36 = (eastTeam6 == null || !eastTeam6.getIsInSeriesSemis().booleanValue()) ? null : eastTeam6;
        } else {
            eastSemis36 = eastTeam3;
        }
        if (eastTeam4 == null || !eastTeam4.getIsInSeriesSemis().booleanValue()) {
            eastSemis45 = (eastTeam5 == null || !eastTeam5.getIsInSeriesSemis().booleanValue()) ? null : eastTeam5;
        } else {
            eastSemis45 = eastTeam4;
        }
        if (westTeam1 == null || !westTeam1.getIsInSeriesSemis().booleanValue()) {
            westSemis18 = (westTeam8 == null || !westTeam8.getIsInSeriesSemis().booleanValue()) ? null : westTeam8;
        } else {
            westSemis18 = westTeam1;
        }
        if (westTeam2 == null || !westTeam2.getIsInSeriesSemis().booleanValue()) {
            westSemis27 = (westTeam7 == null || !westTeam7.getIsInSeriesSemis().booleanValue()) ? null : westTeam7;
        } else {
            westSemis27 = westTeam2;
        }
        if (westTeam3 == null || !westTeam3.getIsInSeriesSemis().booleanValue()) {
            westSemis36 = (westTeam6 == null || !westTeam6.getIsInSeriesSemis().booleanValue()) ? null : westTeam6;
        } else {
            westSemis36 = westTeam3;
        }
        if (westTeam4 == null || !westTeam4.getIsInSeriesSemis().booleanValue()) {
            westSemis45 = (westTeam5 == null || !westTeam5.getIsInSeriesSemis().booleanValue()) ? null : westTeam5;
        } else {
            westSemis45 = westTeam4;
        }
        if (eastSemis18 == null || !eastSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis1845 = (eastSemis45 == null || !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis45;
        } else {
            eastSemis1845 = eastSemis18;
        }
        if (eastSemis27 == null || !eastSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis2736 = (eastSemis36 == null || !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis36;
        } else {
            eastSemis2736 = eastSemis27;
        }
        if (westSemis18 == null || !westSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis1845 = (westSemis45 == null || !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis45;
        } else {
            westSemis1845 = westSemis18;
        }
        if (westSemis27 == null || !westSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis2736 = (westSemis36 == null || !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis36;
        } else {
            westSemis2736 = westSemis27;
        }
        if (eastSemis1845 == null || !eastSemis1845.getIsInSeriesWorldFinal().booleanValue()) {
            eastConference = (eastSemis2736 == null || !eastSemis2736.getIsInSeriesWorldFinal().booleanValue()) ? null : eastSemis2736;
        } else {
            eastConference = eastSemis1845;
        }
        if (westSemis1845 == null || !westSemis1845.getIsInSeriesWorldFinal().booleanValue()) {
            westConference = (westSemis2736 == null || !westSemis2736.getIsInSeriesWorldFinal().booleanValue()) ? null : westSemis2736;
        } else {
            westConference = westSemis1845;
        }
        if (eastConference != null && westConference != null) {
            list.add(new MatchdayCalendar(213, eastConference, westConference, Boolean.TRUE));
            list.add(new MatchdayCalendar(215, eastConference, westConference, Boolean.TRUE));
            list.add(new MatchdayCalendar(217, westConference, eastConference, Boolean.FALSE));
            list.add(new MatchdayCalendar(219, westConference, eastConference, Boolean.FALSE));
            if (!eastConference.getIsChampion().booleanValue() && !westConference.getIsChampion().booleanValue()) {
                list.add(new MatchdayCalendar(221, westConference, eastConference, Boolean.FALSE));
            }
            if (!eastConference.getIsChampion().booleanValue() && !westConference.getIsChampion().booleanValue()) {
                list.add(new MatchdayCalendar(223, eastConference, westConference, Boolean.TRUE));
            }
            if (!eastConference.getIsChampion().booleanValue() && !westConference.getIsChampion().booleanValue()) {
                list.add(new MatchdayCalendar(225, eastConference, westConference, Boolean.TRUE));
            }
        }
        return list;
    }

    private static Playoffs getPlayoffs(List<Playoffs> list, int conference, int position) {
        for (Playoffs playoffs : list) {
            if (playoffs.getConference().intValue() == conference && playoffs.getPosition().intValue() == position) {
                return playoffs;
            }
        }
        return null;
    }

    private static News createNewsAndAdd(List<News> newsList, Game game, int matchday, int type, int title, int body, Object... objects) {
        News news = new News(game.getContext());
        news.setGame(game);
        news.setMatchday(Integer.valueOf(matchday));
        news.setType(Integer.valueOf(type));
        news.setTitle(game.getContext().getString(title));
        news.setBody(String.format(game.getContext().getString(body), objects));
        newsList.add(news);
        return news;
    }

    private static Team findTeam(List<Team> teamList, String name) {
        for (Team team : teamList) {
            if (team.getName().equals(name)) {
                return team;
            }
        }
        return null;
    }
}
