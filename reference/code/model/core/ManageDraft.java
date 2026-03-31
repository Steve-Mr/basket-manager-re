package com.blank.bm15.model.core;

import android.support.v4.util.TimeUtils;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.comparator.DraftRoundComparator;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.generator.Names;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.object.other.DrawerItem;
import com.blank.bm15.model.util.Constant;
import com.blank.bm15.model.util.Setting;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class ManageDraft {
    public static void manageRound1(Game game) {
        createDraftPlayers(game);
        int i = 1;
        String body = "";
        List<DraftRound> draftRoundList = new ArrayList<>();
        for (Classification classification : getDraftClassification(game)) {
            if (!"".equals(body)) {
                body = String.valueOf(body) + "\n";
            }
            body = String.valueOf(body) + String.format(game.getContext().getString(R.string.news_draft_round_body), Integer.valueOf(i)) + " " + classification.getTeam().getDraftRound1().getTeamUser().getName();
            classification.getTeam().getDraftRound1().setPosition(Integer.valueOf(i));
            draftRoundList.add(classification.getTeam().getDraftRound1());
            i++;
        }
        BlankDao.saveOrUpdateAll(draftRoundList);
        createNews(game, game.getCurrentMatchday().intValue(), R.drawable.news_info, R.string.news_draft_round_title_1, body);
        playDraft(game, 1, Boolean.TRUE.booleanValue());
    }

    public static void manageRound2(Game game) {
        int i = 1;
        String body = "";
        List<DraftRound> draftRoundList = new ArrayList<>();
        for (Classification classification : getDraftClassification(game)) {
            if (!"".equals(body)) {
                body = String.valueOf(body) + "\n";
            }
            body = String.valueOf(body) + String.format(game.getContext().getString(R.string.news_draft_round_body), Integer.valueOf(i)) + " " + classification.getTeam().getDraftRound2().getTeamUser().getName();
            classification.getTeam().getDraftRound2().setPosition(Integer.valueOf(i));
            draftRoundList.add(classification.getTeam().getDraftRound2());
            i++;
        }
        BlankDao.saveOrUpdateAll(draftRoundList);
        createNews(game, game.getCurrentMatchday().intValue(), R.drawable.news_info, R.string.news_draft_round_title_2, body);
        playDraft(game, 2, Boolean.TRUE.booleanValue());
    }

    public static void finishDraft(Game game) {
        playDraft(game, 2, Boolean.FALSE.booleanValue());
        Player filter = new Player(game.getContext());
        filter.setGame(game);
        List<Player> playerList = BlankDaoExtra.getDraftPlayers(filter);
        Collections.sort(playerList, new PlayerComparator(0, -1));
        int i = 0;
        for (Player player : playerList) {
            player.setTeam(null);
            i++;
            if (i > playerList.size() - 15) {
                break;
            }
        }
        BlankDao.saveOrUpdateAll(playerList);
        createNews(game, game.getCurrentMatchday().intValue(), R.drawable.news_info, R.string.news_free_agency_title, game.getContext().getString(R.string.news_free_agency_body));
    }

    public static void playDraft(Game game, int round, boolean breakOnTeamOfUser) {
        DraftRound draftRoundFilter = new DraftRound(game.getContext());
        draftRoundFilter.setGame(game);
        draftRoundFilter.setRound(Integer.valueOf(round));
        List<DraftRound> draftRoundList = BlankDao.getSome(draftRoundFilter);
        List<DraftRound> draftRoundToDeleteList = new ArrayList<>();
        Collections.sort(draftRoundList, new DraftRoundComparator(0, 1));
        Player playerFilter = new Player(game.getContext());
        playerFilter.setGame(game);
        for (DraftRound draftRound : draftRoundList) {
            List<Player> playerList = BlankDaoExtra.getDraftPlayers(playerFilter);
            Collections.sort(playerList, new PlayerComparator(0, -1));
            Player player = null;
            if (draftRound.getTeamUser().getId().intValue() == game.getUserTeam().getId().intValue()) {
                if (breakOnTeamOfUser) {
                    break;
                }
            } else if (draftRound.getPosition().intValue() < 4) {
                Player player2 = playerList.get(Util.getRandomValue(0, 2).intValue());
                player = player2;
            } else {
                int pos1 = draftRound.getTeamUser().getNumPlayersOfPosition(1) <= 1 ? 1 : 0;
                int pos2 = draftRound.getTeamUser().getNumPlayersOfPosition(2) <= 1 ? 2 : 0;
                int pos3 = draftRound.getTeamUser().getNumPlayersOfPosition(3) <= 1 ? 3 : 0;
                int pos4 = draftRound.getTeamUser().getNumPlayersOfPosition(4) <= 1 ? 4 : 0;
                int pos5 = draftRound.getTeamUser().getNumPlayersOfPosition(5) <= 1 ? 5 : 0;
                if (needsThatPlayer(playerList.get(0), pos1, pos2, pos3, pos4, pos5)) {
                    Player player3 = playerList.get(0);
                    player = player3;
                } else if (needsThatPlayer(playerList.get(1), pos1, pos2, pos3, pos4, pos5)) {
                    Player player4 = playerList.get(1);
                    player = player4;
                } else if (needsThatPlayer(playerList.get(2), pos1, pos2, pos3, pos4, pos5)) {
                    Player player5 = playerList.get(2);
                    player = player5;
                } else if (needsThatPlayer(playerList.get(3), pos1, pos2, pos3, pos4, pos5)) {
                    Player player6 = playerList.get(3);
                    player = player6;
                } else {
                    Player player7 = playerList.get(Util.getRandomValue(0, 2).intValue());
                    player = player7;
                }
            }
            if (player != null) {
                player.setTeam(draftRound.getTeamUser());
                setDraftPlayerSalaryAndYearsContract(player, draftRound.getRound().intValue(), draftRound.getPosition().intValue());
                BlankDao.saveOrUpdate(player);
                draftRoundToDeleteList.add(draftRound);
            }
        }
        BlankDao.deleteAll(draftRoundToDeleteList);
    }

    public static List<Classification> getDraftClassification(Game game) {
        Classification classification = new Classification(game.getContext());
        classification.setGame(game);
        List<Classification> auxAllList = BlankDaoExtra.getDraft(classification);
        List<Classification> aux1List = new ArrayList<>();
        aux1List.add(auxAllList.get(0));
        aux1List.add(auxAllList.get(1));
        aux1List.add(auxAllList.get(2));
        aux1List.add(auxAllList.get(3));
        Collections.shuffle(aux1List);
        List<Classification> aux2List = new ArrayList<>();
        aux2List.add(auxAllList.get(4));
        aux2List.add(auxAllList.get(5));
        aux2List.add(auxAllList.get(6));
        aux2List.add(auxAllList.get(7));
        Collections.shuffle(aux2List);
        List<Classification> aux3List = new ArrayList<>();
        aux3List.add(auxAllList.get(8));
        aux3List.add(auxAllList.get(9));
        aux3List.add(auxAllList.get(10));
        aux3List.add(auxAllList.get(11));
        Collections.shuffle(aux3List);
        List<Classification> aux4List = new ArrayList<>();
        aux4List.add(auxAllList.get(12));
        aux4List.add(auxAllList.get(13));
        aux4List.add(auxAllList.get(14));
        aux4List.add(auxAllList.get(15));
        Collections.shuffle(aux4List);
        List<Classification> list = new ArrayList<>();
        list.add(aux1List.get(0));
        list.add(aux1List.get(1));
        list.add(aux1List.get(2));
        list.add(aux1List.get(3));
        list.add(aux2List.get(0));
        list.add(aux2List.get(1));
        list.add(aux2List.get(2));
        list.add(aux2List.get(3));
        list.add(aux3List.get(0));
        list.add(aux3List.get(1));
        list.add(aux3List.get(2));
        list.add(aux3List.get(3));
        list.add(aux4List.get(0));
        list.add(aux4List.get(1));
        list.add(aux4List.get(2));
        list.add(aux4List.get(3));
        for (int i = 16; i < auxAllList.size(); i++) {
            list.add(auxAllList.get(i));
        }
        return list;
    }

    public static Player createPlayer(Game game, boolean special) {
        Team team = new Team(game.getContext());
        team.setId(-1);
        Player player = new Player(game.getContext());
        player.setGame(game);
        player.setTeam(team);
        player.setName(Names.getFullName());
        player.setPotential(Integer.valueOf(Util.getRandomPotential(2)));
        player.setPositionFirst(Util.getRandomValue(1, 5));
        player.setPositionSecond(calculatePositionSecond(player));
        player.setAge(Util.getRandomValue(18, 23));
        player.setStateInjury(0);
        player.setStateEnergy(99);
        player.setSalary(0);
        player.setLoyalty(Util.getRandomValue(1, 5));
        player.setYearsExperience(0);
        player.setYearsContract(0);
        player.setStateForm(Util.getRandomValue(30, 70));
        if (player.getAge().intValue() > 18 && player.getPotential().intValue() > 6) {
            player.setAge(Integer.valueOf(player.getAge().intValue() - 1));
        }
        int specialBono = 0;
        if (special) {
            specialBono = changeSpecialPlayer(player);
        }
        int baseSkill = Util.getRandomValue(0, 10).intValue();
        player.setSkillPhysique(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 1).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillBlock(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 2).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillSteal(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 3).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillRebound(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 4).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillPass(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 5).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillShotInterior(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 6).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillShotExterior(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 7).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        player.setSkillShotFree(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 8).intValue() + baseSkill + player.getPotential().intValue() + Util.getRandomValue(15, 32).intValue() + specialBono));
        return player;
    }

    private static int changeSpecialPlayer(Player player) {
        int specialBono = 0;
        player.setPotential(Util.getRandomValue(1, 3));
        if (Util.getRandomValue(1, 50).intValue() == 1) {
            specialBono = 2;
            player.setPotential(10);
            player.setPositionSecond(0);
            player.setAge(18);
            int random = Util.getRandomValue(1, 20).intValue();
            if (random == 1) {
                player.setName("Spud Webb");
                player.setPositionFirst(1);
            } else if (random == 2) {
                player.setName("Magic Johnson");
                player.setPositionFirst(1);
            } else if (random == 3) {
                player.setName("Allen Iverson");
                player.setPositionFirst(1);
            } else if (random == 4) {
                player.setName("Oscar Robertson");
                player.setPositionFirst(1);
            } else if (random == 5) {
                player.setName("John Stockton");
                player.setPositionFirst(1);
            } else if (random == 6) {
                player.setName("Pete Maravich");
                player.setPositionFirst(1);
            } else if (random == 7) {
                player.setName("Isiah Thomas");
                player.setPositionFirst(1);
            } else if (random == 8) {
                player.setName("Michael Jordan");
                player.setPositionFirst(2);
            } else if (random == 9) {
                player.setName("Larry Bird");
                player.setPositionFirst(3);
            } else if (random == 10) {
                player.setName("Scottie Pippen");
                player.setPositionFirst(3);
            } else if (random == 11) {
                player.setName("Len Bias");
                player.setPositionFirst(3);
            } else if (random == 12) {
                player.setName("Julius Erving");
                player.setPositionFirst(3);
            } else if (random == 13) {
                player.setName("Dominique Wilkins");
                player.setPositionFirst(3);
            } else if (random == 14) {
                player.setName("Charles Barkley");
                player.setPositionFirst(4);
            } else if (random == 15) {
                player.setName("Karl Malone");
                player.setPositionFirst(4);
            } else if (random == 16) {
                player.setName("Kevin McHale");
                player.setPositionFirst(4);
            } else if (random == 17) {
                player.setName("Shaquille O’Neal");
                player.setPositionFirst(5);
            } else if (random == 18) {
                player.setName("Wilt Chamberlain");
                player.setPositionFirst(5);
            } else if (random == 19) {
                player.setName("Hakeem Olajuwon");
                player.setPositionFirst(5);
            } else if (random == 20) {
                player.setName("Kareem AbdulJabbar");
                player.setPositionFirst(5);
            }
        }
        return specialBono;
    }

    private static Integer calculatePositionSecond(Player player) {
        Integer aux = Util.getRandomValue(1, 5);
        if (player.getPotential().intValue() > 8) {
            aux = Integer.valueOf(aux.intValue() - 1);
        }
        if (aux.intValue() >= 3) {
            return 0;
        }
        if (player.getPositionFirst().intValue() == 1) {
            Integer posicionSecundaria = Integer.valueOf(player.getPositionFirst().intValue() + 1);
            return posicionSecundaria;
        }
        if (player.getPositionFirst().intValue() == 5) {
            Integer posicionSecundaria2 = Integer.valueOf(player.getPositionFirst().intValue() - 1);
            return posicionSecundaria2;
        }
        int random = Util.getRandomValue(1, 2).intValue();
        if (random == 2) {
            random = -1;
        }
        Integer posicionSecundaria3 = Integer.valueOf(player.getPositionFirst().intValue() + random);
        return posicionSecundaria3;
    }

    private static boolean needsThatPlayer(Player player, int pos1, int pos2, int pos3, int pos4, int pos5) {
        return (player.getPositionFirst().intValue() == pos1 || player.getPositionFirst().intValue() == pos2 || player.getPositionFirst().intValue() == pos3 || player.getPositionFirst().intValue() == pos4 || player.getPositionFirst().intValue() == pos5) ? Boolean.TRUE.booleanValue() : Boolean.FALSE.booleanValue();
    }

    private static void createDraftPlayers(Game game) {
        List<Player> addPlayerList = new ArrayList<>();
        int i = 0;
        while (i < 90) {
            addPlayerList.add(createPlayer(game, i < 2));
            i++;
        }
        BlankDao.saveOrUpdateAll(addPlayerList);
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

    public static void setDraftPlayerSalaryAndYearsContract(Player player, int round, int pick) {
        if (round == 1) {
            player.setYearsContract(4);
            switch (pick) {
                case 1:
                    player.setSalary(6000000);
                    return;
                case 2:
                    player.setSalary(5500000);
                    return;
                case 3:
                    player.setSalary(4500000);
                    return;
                case 4:
                    player.setSalary(4250000);
                    return;
                case 5:
                    player.setSalary(4000000);
                    return;
                case 6:
                    player.setSalary(3750000);
                    return;
                case 7:
                    player.setSalary(3500000);
                    return;
                case 8:
                    player.setSalary(3250000);
                    return;
                case 9:
                    player.setSalary(3000000);
                    return;
                case 10:
                    player.setSalary(2750000);
                    return;
                case 11:
                    player.setSalary(2500000);
                    return;
                case 12:
                    player.setSalary(2250000);
                    return;
                case 13:
                    player.setSalary(2000000);
                    return;
                case 14:
                    player.setSalary(1800000);
                    return;
                case 15:
                    player.setSalary(1600000);
                    return;
                case 16:
                    player.setSalary(1400000);
                    return;
                case Setting.ATTEMPT_LOSS /* 17 */:
                    player.setSalary(1200000);
                    return;
                case 18:
                    player.setSalary(Integer.valueOf(Constant.SALARY_MIN));
                    return;
                case TimeUtils.HUNDRED_DAY_FIELD_LEN /* 19 */:
                    player.setSalary(950000);
                    return;
                case 20:
                    player.setSalary(900000);
                    return;
                case DrawerItem.ITEM_MARKET_DRAFT /* 21 */:
                    player.setSalary(850000);
                    return;
                case 22:
                    player.setSalary(800000);
                    return;
                case DrawerItem.ITEM_MARKET_FREE_AGENTS /* 23 */:
                    player.setSalary(750000);
                    return;
                case DrawerItem.ITEM_MARKET_FINANCES /* 24 */:
                    player.setSalary(700000);
                    return;
                case 25:
                    player.setSalary(650000);
                    return;
                case 26:
                    player.setSalary(600000);
                    return;
                case 27:
                    player.setSalary(550000);
                    return;
                case 28:
                    player.setSalary(500000);
                    return;
                case 29:
                    player.setSalary(450000);
                    return;
                case 30:
                    player.setSalary(400000);
                    return;
                default:
                    return;
            }
        }
        player.setYearsContract(Util.getRandomValue(2, 3));
        player.setSalary(Integer.valueOf(305000 - (pick * 5000)));
    }
}
