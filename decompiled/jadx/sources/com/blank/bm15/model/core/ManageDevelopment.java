package com.blank.bm15.model.core;

import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ManageDevelopment {
    public static void manage(Game game) {
        List<Player> playerList = getPlayersToDevelop(game);
        MatchResult mrFilter = new MatchResult(game.getContext());
        for (Player player : playerList) {
            int oldPotential = 0;
            int oldRating = 0;
            if (player.getTeam().getId() != null && player.getTeam().getId().intValue() == game.getUserTeam().getId().intValue()) {
                oldPotential = player.getPotential().intValue();
                oldRating = BlankObj.toInteger(player.getAverageSkillAll()).intValue();
            }
            mrFilter.setPlayer(player);
            mrFilter.setMatchday(game.getCurrentMatchday());
            List<MatchResult> matchResultList = BlankDaoExtra.getDevelopPlayer(mrFilter);
            MatchResult mrTotal = new MatchResult(game.getContext());
            mrTotal.setMatches(0);
            for (MatchResult other : matchResultList) {
                mrTotal.addMatchResult(other);
            }
            int loops = 3;
            if (player.getPotential().intValue() <= 4 && player.getAge().intValue() < 30) {
                loops = 0;
            } else if (player.getPotential().intValue() <= 6 && player.getAge().intValue() < 30) {
                loops = 1;
            } else if (player.getPotential().intValue() <= 8 && player.getAge().intValue() < 30) {
                loops = 2;
            } else if (player.getPotential().intValue() <= 9 && player.getAge().intValue() < 30) {
                loops = 4;
            } else if (player.getPotential().intValue() <= 10 && player.getAge().intValue() < 30) {
                loops = 5;
            }
            if (player.getAverageSkillAll().doubleValue() > 90.0d && player.getAge().intValue() < 30) {
                loops--;
            }
            if (player.getAge().intValue() < 21) {
                loops++;
            }
            int minutesAverage = mrTotal.getMatches().intValue() == 0 ? 0 : mrTotal.getMinutesPlayed().intValue() / mrTotal.getMatches().intValue();
            double perAverage = mrTotal.getMatches().intValue() == 0 ? 0.0d : mrTotal.getPer().doubleValue() / ((double) mrTotal.getMatches().intValue());
            for (int i = 0; i < loops; i++) {
                int randomPotential = Util.getRandomValue(1, 10).intValue();
                if (player.getAge().intValue() < 30 || randomPotential < player.getPotential().intValue() - 4) {
                    int randomDevelopment = ((int) perAverage) + Util.getRandomValue(Integer.valueOf((player.getPotential().intValue() * (30 - player.getAge().intValue())) + minutesAverage), 150).intValue();
                    if (randomDevelopment > 138 && (Util.getRandomValue(1, 10).intValue() >= 6 || player.getAverageSkillAll().doubleValue() < 76.0d)) {
                        developIncrement(game, player);
                    }
                } else if (player.getAge().intValue() > 30) {
                    int random = Util.getRandomValue(Integer.valueOf(player.getPotential().intValue() + minutesAverage), 140).intValue();
                    if (random < 55) {
                        developDecrement(game, player);
                    }
                }
            }
            if (Util.getRandomValue(1, 200).intValue() == 1) {
                changePotential(game, player);
            }
            if (player.getStateInjury().intValue() > 100 || Util.getRandomValue(1, Integer.valueOf(player.getSkillPhysique().intValue() + player.getStateEnergy().intValue())).intValue() < 2) {
                developDecrement(game, player);
            }
            if (player.getTeam().getId() != null && player.getTeam().getId().intValue() == game.getUserTeam().getId().intValue()) {
                if (player.getPotential().intValue() != oldPotential) {
                    int type = player.getPotential().intValue() > oldPotential ? R.drawable.news_improve : R.drawable.news_decline;
                    int title = player.getPotential().intValue() > oldPotential ? R.string.news_player_improved_potential_title : R.string.news_player_decline_potential_title;
                    int body = player.getPotential().intValue() > oldPotential ? R.string.news_player_improved_potential_body : R.string.news_player_decline_potential_body;
                    createNews(game, game.getCurrentMatchday().intValue(), type, title, body, player.getShortName());
                }
                int newRating = BlankObj.toInteger(player.getAverageSkillAll()).intValue();
                if (newRating != oldRating) {
                    int type2 = newRating > oldRating ? R.drawable.news_improve : R.drawable.news_decline;
                    int title2 = newRating > oldRating ? R.string.news_player_improved_title : R.string.news_player_decline_title;
                    int body2 = newRating > oldRating ? R.string.news_player_improved_body : R.string.news_player_decline_body;
                    createNews(game, game.getCurrentMatchday().intValue(), type2, title2, body2, player.getShortName(), BlankObj.toString(Integer.valueOf(oldRating)), BlankObj.toString(Integer.valueOf(newRating)));
                }
            }
        }
        BlankDao.saveOrUpdateAll(playerList);
    }

    private static List<Player> getPlayersToDevelop(Game game) {
        Player pFilter = new Player(game.getContext());
        pFilter.setGame(game);
        List<Player> playerList = new ArrayList<>();
        List<Player> auxPlayerList = BlankDao.getSome(pFilter);
        String idCurrentMatchday = BlankObj.toString(game.getCurrentMatchday());
        String idCurrentMatchdayEnd = idCurrentMatchday.substring(idCurrentMatchday.length() - 1);
        for (Player player : auxPlayerList) {
            String idPlayer = BlankObj.toString(player.getId());
            String idPlayerEnd = idPlayer.substring(idPlayer.length() - 1);
            if (idPlayerEnd.equals(idCurrentMatchdayEnd)) {
                playerList.add(player);
            }
        }
        return playerList;
    }

    private static void developIncrement(Game game, Player player) {
        developRulete(game, player, Boolean.TRUE.booleanValue(), 0);
    }

    private static void developDecrement(Game game, Player player) {
        developRulete(game, player, Boolean.FALSE.booleanValue(), 0);
    }

    private static void changePotential(Game game, Player player) {
        int newPotential = player.getPotential().intValue() + Util.getRandomValue(-1, 1).intValue();
        if (newPotential != player.getPotential().intValue()) {
            player.setPotential(Integer.valueOf(newPotential));
        }
    }

    private static void developRulete(Game game, Player player, boolean increment, int recursivity) {
        int total = getSumBaseOfPositions(player, 8);
        int random = Util.getRandomValue(1, Integer.valueOf(total)).intValue();
        if (random <= getSumBaseOfPositions(player, 1)) {
            if (player.getSkillPhysique().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillPhysique(Integer.valueOf((increment ? 1 : -1) + player.getSkillPhysique().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 2)) {
            if (player.getSkillBlock().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillBlock(Integer.valueOf((increment ? 1 : -1) + player.getSkillBlock().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 3)) {
            if (player.getSkillSteal().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillSteal(Integer.valueOf((increment ? 1 : -1) + player.getSkillSteal().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 4)) {
            if (player.getSkillRebound().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillRebound(Integer.valueOf((increment ? 1 : -1) + player.getSkillRebound().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 5)) {
            if (player.getSkillPass().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillPass(Integer.valueOf((increment ? 1 : -1) + player.getSkillPass().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 6)) {
            if (player.getSkillShotInterior().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillShotInterior(Integer.valueOf((increment ? 1 : -1) + player.getSkillShotInterior().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 7)) {
            if (player.getSkillShotExterior().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
                return;
            } else {
                player.setSkillShotExterior(Integer.valueOf((increment ? 1 : -1) + player.getSkillShotExterior().intValue()));
                return;
            }
        }
        if (random <= getSumBaseOfPositions(player, 8)) {
            if (player.getSkillShotFree().intValue() == 99 && recursivity < 3) {
                developRulete(game, player, increment, recursivity + 1);
            } else {
                player.setSkillShotFree(Integer.valueOf((increment ? 1 : -1) + player.getSkillShotFree().intValue()));
            }
        }
    }

    private static int getSumBaseOfPositions(Player player, int numSkill) {
        int result = 0;
        for (int i = 1; i <= numSkill; i++) {
            if (i == 1) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 1).intValue() + 15;
            } else if (i == 2) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 2).intValue() + 15;
            } else if (i == 3) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 3).intValue() + 15;
            } else if (i == 4) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 4).intValue() + 15;
            } else if (i == 5) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 5).intValue() + 15;
            } else if (i == 6) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 6).intValue() + 15;
            } else if (i == 7) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 7).intValue() + 15;
            } else if (i == 8) {
                result += Player.getBaseOfPosition(player.getPositionFirst().intValue(), 8).intValue() + 15;
            }
        }
        return result;
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
