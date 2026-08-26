package com.blank.bm15.model.core;

import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.comparator.OfferComparator;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.comparator.WorstPositionComparator;
import com.blank.bm15.model.generator.Names;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.WorstPosition;
import com.blank.bm15.model.util.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ManageFreeAgency {
    public static void manage(Game game, Team team) {
        int minPlayers = Util.getRandomValue(14, 15).intValue();
        int curPlayers = team.getTactic().getPlayers().size();
        int maxPlayers = 20 - Util.getRandomValue(0, 2).intValue();
        boolean fewPlayers = getFewPlayersInPosition(team);
        if (curPlayers >= minPlayers && !fewPlayers) {
            return;
        }
        while (true) {
            if ((curPlayers < minPlayers || fewPlayers) && curPlayers <= maxPlayers) {
                singUpNewFreeAgencyPlayer(team, getWeakerPositionOfTeam(team));
                curPlayers = team.getTactic().getPlayers().size();
                fewPlayers = getFewPlayersInPosition(team);
            } else {
                return;
            }
        }
    }

    public static boolean manageLastMathcdayOffers(Game game, List<Player> playerList) {
        Integer yearsContract;
        Team filter = new Team(game.getContext());
        filter.setGame(game);
        List<Team> teamList = BlankDao.getSome(filter);
        for (Team team : teamList) {
            int curPlayers = team.getTactic().getPlayers().size();
            int maxPlayers = 20 - Util.getRandomValue(0, 2).intValue();
            if (team.getId().intValue() != game.getUserTeam().getId().intValue() && curPlayers <= maxPlayers) {
                int salaryAvailable = team.getSalaryCap().intValue() - team.getTeamSalary(null).intValue();
                int worstPosition = getWeakerPositionOfTeam(team);
                Iterator<Player> it = playerList.iterator();
                while (true) {
                    if (it.hasNext()) {
                        Player player = it.next();
                        Integer salary = Util.getSalary(player);
                        boolean choosePlayer = player.getAverageSkillAll().doubleValue() > 84.0d || Util.getRandomValue(0, 2).intValue() != 0;
                        if (player.getPositionFirst().intValue() == worstPosition || player.getPositionSecond().intValue() == worstPosition) {
                            if (salaryAvailable > salary.intValue() || salary.intValue() < 1000000) {
                                if (player.getValue().doubleValue() > getWorstPositionOfTeam(team).getAverageValue().intValue() && choosePlayer) {
                                    Offer offer = new Offer(game.getContext());
                                    offer.setTeam(team);
                                    if (player.getAge().intValue() <= 25) {
                                        yearsContract = Util.getRandomValue(2, 4);
                                    } else if (player.getAge().intValue() <= 30) {
                                        yearsContract = Util.getRandomValue(1, 4);
                                    } else {
                                        yearsContract = player.getAge().intValue() <= 34 ? Util.getRandomValue(1, 3) : Util.getRandomValue(1, 2);
                                    }
                                    offer.setYears(yearsContract);
                                    offer.setSalary(Integer.valueOf(Integer.valueOf(Integer.valueOf(salary.intValue() + ((salary.intValue() * Util.getRandomValue(-25, 25).intValue()) / 100)).intValue() / 1000).intValue() * 1000));
                                    player.getOfferList().add(offer);
                                }
                            }
                        }
                    }
                }
            }
        }
        Boolean acceptOfferOfPlayer = Boolean.FALSE;
        for (Player player2 : playerList) {
            if (player2.getOfferList().size() > 0) {
                Collections.sort(player2.getOfferList(), new OfferComparator(0, -1));
                player2.setSalary(player2.getOfferList().get(0).getSalary());
                player2.setYearsContract(player2.getOfferList().get(0).getYears());
                player2.setTeam(player2.getOfferList().get(0).getTeam());
                if (player2.getOfferList().get(0).getTeam().getId().intValue() == game.getUserTeam().getId().intValue()) {
                    acceptOfferOfPlayer = Boolean.TRUE;
                }
            }
        }
        BlankDao.saveOrUpdateAll(playerList);
        return acceptOfferOfPlayer.booleanValue();
    }

    private static void singUpNewFreeAgencyPlayer(Team team, int position) {
        Integer yearsContract;
        Player filter = new Player(team.getContext());
        filter.setGame(team.getGame());
        List<Player> playerList = BlankDaoExtra.getFreeAgents(filter);
        Collections.sort(playerList, new PlayerComparator(0, -1));
        boolean found = Boolean.FALSE.booleanValue();
        Integer salaryAvailable = Integer.valueOf(team.getSalaryCap().intValue() - team.getTeamSalary(null).intValue());
        Iterator<Player> it = playerList.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Player player = it.next();
            boolean isCorrectPosition = player.getPositionFirst().intValue() == position;
            if (!isCorrectPosition && player.getPositionSecond() != null) {
                isCorrectPosition = player.getPositionSecond().intValue() == position;
            }
            Integer salary = Util.getSalary(player);
            if (salaryAvailable.intValue() > salary.intValue() || salary.intValue() < 1000000) {
                if (isCorrectPosition) {
                    player.setTeam(team);
                    if (player.getAge().intValue() <= 25) {
                        yearsContract = Util.getRandomValue(2, 4);
                    } else if (player.getAge().intValue() <= 30) {
                        yearsContract = Util.getRandomValue(1, 4);
                    } else {
                        yearsContract = player.getAge().intValue() <= 34 ? Util.getRandomValue(1, 3) : Util.getRandomValue(1, 2);
                    }
                    player.setYearsContract(yearsContract);
                    player.setSalary(Integer.valueOf(Integer.valueOf(Integer.valueOf(salary.intValue() + ((salary.intValue() * Util.getRandomValue(-15, 15).intValue()) / 100)).intValue() / 1000).intValue() * 1000));
                    BlankDao.saveOrUpdate(player);
                    found = Boolean.TRUE.booleanValue();
                }
            }
        }
        if (!found) {
            BlankDao.saveOrUpdate(createSecondaryPlayer(team, position));
        }
        team.getTactic().reloadPlayers();
    }

    private static boolean getFewPlayersInPosition(Team team) {
        int numPG = team.getNumPlayersOfPosition(1);
        int numSG = team.getNumPlayersOfPosition(2);
        int numSF = team.getNumPlayersOfPosition(3);
        int numPF = team.getNumPlayersOfPosition(4);
        int numCE = team.getNumPlayersOfPosition(5);
        return numPG < 3 || numSG < 3 || numSF < 3 || numPF < 3 || numCE < 3;
    }

    private static int getWeakerPositionOfTeam(Team team) {
        int numPG = team.getNumPlayersOfPosition(1);
        int numSG = team.getNumPlayersOfPosition(2);
        int numSF = team.getNumPlayersOfPosition(3);
        int numPF = team.getNumPlayersOfPosition(4);
        int numCE = team.getNumPlayersOfPosition(5);
        if (Util.getRandomValue(0, 1).intValue() == 0) {
            if (numPG < 3) {
                return 1;
            }
            if (numSG < 3) {
                return 2;
            }
            if (numSF < 3) {
                return 3;
            }
            if (numPF < 3) {
                return 4;
            }
            if (numCE < 3) {
                return 5;
            }
        } else {
            if (numCE < 3) {
                return 5;
            }
            if (numPG < 3) {
                return 4;
            }
            if (numSF < 3) {
                return 3;
            }
            if (numSG < 3) {
                return 2;
            }
            if (numPG < 3) {
                return 1;
            }
        }
        return getWorstPositionOfTeam(team).getPosition().intValue();
    }

    private static WorstPosition getWorstPositionOfTeam(Team team) {
        ArrayList<WorstPosition> worstPositionList = new ArrayList<>();
        worstPositionList.add(new WorstPosition(1, Integer.valueOf(team.getNumPlayersOfPosition(1))));
        worstPositionList.add(new WorstPosition(2, Integer.valueOf(team.getNumPlayersOfPosition(2))));
        worstPositionList.add(new WorstPosition(3, Integer.valueOf(team.getNumPlayersOfPosition(3))));
        worstPositionList.add(new WorstPosition(4, Integer.valueOf(team.getNumPlayersOfPosition(4))));
        worstPositionList.add(new WorstPosition(5, Integer.valueOf(team.getNumPlayersOfPosition(5))));
        Collections.sort(worstPositionList, new WorstPositionComparator(0, 1));
        return worstPositionList.get(0);
    }

    private static Player createSecondaryPlayer(Team team, int position) {
        Player player = new Player(team.getContext());
        player.setGame(team.getGame());
        player.setTeam(team);
        player.setName(Names.getFullName());
        player.setPotential(5);
        player.setPositionFirst(Integer.valueOf(position));
        player.setAge(Util.getRandomValue(19, 23));
        player.setStateInjury(0);
        player.setStateEnergy(99);
        player.setSalary(0);
        player.setLoyalty(Util.getRandomValue(1, 5));
        player.setYearsExperience(0);
        player.setYearsContract(0);
        player.setStateForm(Util.getRandomValue(30, 70));
        player.setSkillPhysique(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 1).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillBlock(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 2).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillSteal(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 3).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillRebound(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 4).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillPass(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 5).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillShotInterior(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 6).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillShotExterior(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 7).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        player.setSkillShotFree(Integer.valueOf(Player.getBaseOfPosition(player.getPositionFirst().intValue(), 8).intValue() + (player.getPotential().intValue() * 2) + Util.getRandomValue(10, 30).intValue()));
        return player;
    }
}
