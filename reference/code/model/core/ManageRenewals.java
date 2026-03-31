package com.blank.bm15.model.core;

import com.blank.bm15.activity.fragment.ClassificationTotalFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Tactic;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.util.Constant;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class ManageRenewals {
    public static void manage(Game game) {
        List<Classification> eastList = ClassificationTotalFragment.getClassification(game, 1);
        calculateNewSalaryCap(game, eastList);
        List<Classification> westList = ClassificationTotalFragment.getClassification(game, 2);
        calculateNewSalaryCap(game, westList);
        Player filter = new Player(game.getContext());
        filter.setGame(game);
        filter.setYearsContract(0);
        List<Player> playerList = BlankDao.getSome(filter);
        String news = "";
        for (Player player : playerList) {
            if (player.getTeam().getId() != null && player.getTeam().getId().intValue() != game.getUserTeam().getId().intValue()) {
                if (player.getIsBestInPosition(Boolean.TRUE).booleanValue() || player.getIsBestInPosition(Boolean.FALSE).booleanValue()) {
                    atemptToRenew(player);
                } else if (player.getIsUniqueInPosition(Boolean.TRUE).booleanValue() || player.getIsUniqueInPosition(Boolean.FALSE).booleanValue()) {
                    atemptToRenew(player);
                } else if (player.getAge().intValue() < 24 && player.getPotential().intValue() > 7 && player.getTeam().getTactic().getPlayers().size() < 14) {
                    atemptToRenew(player);
                } else if (player.getAge().intValue() > 33 && player.getAverageSkillAll().intValue() > 80) {
                    atemptToRenew(player);
                } else {
                    player.setTeam(null);
                }
            } else if (player.getTeam().getId() != null && player.getTeam().getId().intValue() == game.getUserTeam().getId().intValue()) {
                if (!"".equals(news)) {
                    news = String.valueOf(news) + "\n";
                }
                if (player.getLoyalty().intValue() == 1) {
                    news = String.valueOf(news) + String.format(game.getContext().getString(R.string.news_renewals_loyalty_1), player.getShortName());
                } else if (player.getLoyalty().intValue() == 2) {
                    news = String.valueOf(news) + String.format(game.getContext().getString(R.string.news_renewals_loyalty_2), player.getShortName());
                } else if (player.getLoyalty().intValue() == 3) {
                    news = String.valueOf(news) + String.format(game.getContext().getString(R.string.news_renewals_loyalty_3), player.getShortName());
                } else if (player.getLoyalty().intValue() == 4) {
                    news = String.valueOf(news) + String.format(game.getContext().getString(R.string.news_renewals_loyalty_4), player.getShortName());
                } else if (player.getLoyalty().intValue() == 5) {
                    news = String.valueOf(news) + String.format(game.getContext().getString(R.string.news_renewals_loyalty_5), player.getShortName());
                }
            }
        }
        createNews(game, game.getCurrentMatchday().intValue(), R.drawable.news_info, R.string.news_renewals_title, news);
    }

    public static void finishRenewals(Game game) {
        Player filter = new Player(game.getContext());
        filter.setGame(game);
        filter.setYearsContract(0);
        List<Player> playerList = BlankDao.getSome(filter);
        for (Player player : playerList) {
            player.setTeam(null);
            player.setSalary(0);
        }
        BlankDao.saveOrUpdateAll(playerList);
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

    private static void atemptToRenew(Player player) {
        Integer yearsContract;
        Integer offerPosition = Util.getRandomValue(0, 2);
        Boolean renew = Boolean.valueOf(Util.getRandomValue(0, 10).intValue() < offerPosition.intValue() + player.getLoyalty().intValue());
        if (!renew.booleanValue()) {
            Integer offerPosition2 = Util.getRandomValue(2, 4);
            renew = Boolean.valueOf(Util.getRandomValue(0, 10).intValue() < offerPosition2.intValue() + player.getLoyalty().intValue());
        }
        if (renew.booleanValue()) {
            if (player.getAge().intValue() <= 25) {
                yearsContract = Util.getRandomValue(2, 4);
            } else if (player.getAge().intValue() <= 30) {
                yearsContract = Util.getRandomValue(1, 4);
            } else {
                yearsContract = player.getAge().intValue() <= 34 ? Util.getRandomValue(1, 3) : Util.getRandomValue(1, 2);
            }
            player.setYearsContract(yearsContract);
            Integer salary = Util.getSalary(player);
            player.setSalary(Integer.valueOf(Integer.valueOf(Integer.valueOf(salary.intValue() + ((salary.intValue() * Util.getRandomValue(-15, 15).intValue()) / 100)).intValue() / 1000).intValue() * 1000));
            BlankDao.saveOrUpdate(player);
        }
    }

    private static void calculateNewSalaryCap(Game game, List<Classification> list) {
        List<Team> teamList = new ArrayList<>();
        for (Classification classification : list) {
            Team team = classification.getTeam();
            teamList.add(team);
            if (classification.getIsClassified().booleanValue()) {
                team.addSalaryCap(Integer.valueOf(Constant.SALARY_CAP_PLUS.intValue() * 2));
                if (classification.getPositionInDivision().intValue() == 1) {
                    team.addSalaryCap(Constant.SALARY_CAP_PLUS);
                }
                if (team.getPlayoffs().getIsInSeriesSemis().booleanValue()) {
                    team.addSalaryCap(Constant.SALARY_CAP_PLUS);
                }
                if (team.getPlayoffs().getIsInSeriesConferenceFinal().booleanValue()) {
                    team.addSalaryCap(Constant.SALARY_CAP_PLUS);
                }
                if (team.getPlayoffs().getIsInSeriesWorldFinal().booleanValue()) {
                    team.addSalaryCap(Constant.SALARY_CAP_PLUS);
                }
                if (team.getPlayoffs().getIsChampion().booleanValue()) {
                    team.addSalaryCap(Constant.SALARY_CAP_PLUS);
                }
            } else {
                team.addSalaryCap(Integer.valueOf(Constant.SALARY_CAP_PLUS.intValue() * (-3)));
                if (classification.getPositionInDivision().intValue() == 5) {
                    team.addSalaryCap(Integer.valueOf(Constant.SALARY_CAP_PLUS.intValue() * (-1)));
                }
                if (classification.getPositionInConference().intValue() == 15) {
                    team.addSalaryCap(Integer.valueOf(Constant.SALARY_CAP_PLUS.intValue() * (-1)));
                }
            }
            if (game.getUserTeam().getId().intValue() == team.getId().intValue()) {
                createNews(game, game.getCurrentMatchday().intValue(), R.drawable.news_info, R.string.news_salary_cap_title, String.format(game.getContext().getString(R.string.news_salary_cap_body), Util.formatSalary(team.getSalaryCap())));
            }
        }
        BlankDao.saveOrUpdateAll(teamList);
    }

    private static void createNews(Game game, int matchday, int type, int title, String body) {
        News news = new News(game.getContext());
        news.setGame(game);
        news.setMatchday(Integer.valueOf(matchday));
        news.setType(Integer.valueOf(type));
        news.setTitle(game.getContext().getString(title));
        news.setBody(body);
        BlankDao.saveOrUpdate(news);
    }
}
