package com.blank.bm15.model.core;

import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Tactic;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class Lineup {
    public static boolean validateTeam(Team team) {
        Tactic tactic = team.getTactic();
        if (!validatePlayerInTeam(team, tactic.getLineupTitularPointGuard()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupTitularShootingGuard()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupTitularSmallForward()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupTitularPowerForward()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupTitularCenter()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupReservePointGuard()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupReserveShootingGuard()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupReserveSmallForward()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupReservePowerForward()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        if (!validatePlayerInTeam(team, tactic.getLineupReserveCenter()).booleanValue()) {
            return Boolean.FALSE.booleanValue();
        }
        return Boolean.TRUE.booleanValue();
    }

    public static void removeAll(Team team, Boolean save) {
        Tactic tactic = team.getTactic();
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
        tactic.setTacticStarOne(null);
        tactic.setTacticStarTwo(null);
        tactic.setTacticStarThree(null);
        if (save != null && save.booleanValue()) {
            BlankDao.saveOrUpdate(tactic);
        }
    }

    public static void setBetterLineup(Team team) {
        Player bestPlayer;
        Player bestPlayer2;
        Player bestPlayer3;
        Player bestPlayer4;
        Player bestPlayer5;
        Player bestPlayer6;
        Player bestPlayer7;
        Player bestPlayer8;
        Player bestPlayer9;
        Player bestPlayer10;
        Player worst;
        Player worst2;
        Tactic tactic = team.getTactic();
        Integer randomTitulars = Util.getRandomValue(45, 55);
        Integer randomReserves = Util.getRandomValue(25, 35);
        removeAll(team, Boolean.FALSE);
        Player player = getBestPlayerForPositionFirst(team, 1, randomTitulars.intValue());
        tactic.setLineupTitularPointGuard(player == null ? null : player.getId());
        Player player2 = getBestPlayerForPositionFirst(team, 2, randomTitulars.intValue());
        tactic.setLineupTitularShootingGuard(player2 == null ? null : player2.getId());
        Player player3 = getBestPlayerForPositionFirst(team, 3, randomTitulars.intValue());
        tactic.setLineupTitularSmallForward(player3 == null ? null : player3.getId());
        Player player4 = getBestPlayerForPositionFirst(team, 4, randomTitulars.intValue());
        tactic.setLineupTitularPowerForward(player4 == null ? null : player4.getId());
        Player player5 = getBestPlayerForPositionFirst(team, 5, randomTitulars.intValue());
        tactic.setLineupTitularCenter(player5 == null ? null : player5.getId());
        for (Player playerWithTwoPositions : getPlayersWithTwoPositions(team, randomTitulars.intValue())) {
            Player auxFirst = tactic.getTitularPlayer(playerWithTwoPositions.getPositionFirst().intValue());
            Player auxSecond = tactic.getTitularPlayer(playerWithTwoPositions.getPositionSecond().intValue());
            if (auxFirst == null) {
                tactic.setTitularPosition(playerWithTwoPositions, playerWithTwoPositions.getPositionFirst().intValue());
            } else if (auxSecond == null) {
                tactic.setTitularPosition(playerWithTwoPositions, playerWithTwoPositions.getPositionSecond().intValue());
            } else {
                double difFirst = playerWithTwoPositions.getMatchValue(playerWithTwoPositions.getPositionFirst()).doubleValue() - auxFirst.getMatchValue(playerWithTwoPositions.getPositionFirst()).doubleValue();
                double difSecond = playerWithTwoPositions.getMatchValue(playerWithTwoPositions.getPositionSecond()).doubleValue() - auxSecond.getMatchValue(playerWithTwoPositions.getPositionSecond()).doubleValue();
                if (difFirst > 0.0d || difSecond > 0.0d) {
                    if (difFirst >= difSecond) {
                        worst2 = auxFirst;
                    } else {
                        worst2 = auxSecond;
                    }
                    tactic.setTitularPosition(playerWithTwoPositions, tactic.getTitularPosition(worst2).intValue());
                }
            }
        }
        Player player6 = getBestPlayerForPositionFirst(team, 1, randomReserves.intValue());
        tactic.setLineupReservePointGuard(player6 == null ? null : player6.getId());
        Player player7 = getBestPlayerForPositionFirst(team, 2, randomReserves.intValue());
        tactic.setLineupReserveShootingGuard(player7 == null ? null : player7.getId());
        Player player8 = getBestPlayerForPositionFirst(team, 3, randomReserves.intValue());
        tactic.setLineupReserveSmallForward(player8 == null ? null : player8.getId());
        Player player9 = getBestPlayerForPositionFirst(team, 4, randomReserves.intValue());
        tactic.setLineupReservePowerForward(player9 == null ? null : player9.getId());
        Player player10 = getBestPlayerForPositionFirst(team, 5, randomReserves.intValue());
        tactic.setLineupReserveCenter(player10 == null ? null : player10.getId());
        for (Player playerWithTwoPositions2 : getPlayersWithTwoPositions(team, randomReserves.intValue())) {
            Player auxFirst2 = tactic.getReservePlayer(playerWithTwoPositions2.getPositionFirst().intValue());
            Player auxSecond2 = tactic.getReservePlayer(playerWithTwoPositions2.getPositionSecond().intValue());
            if (auxFirst2 == null) {
                tactic.setReservePosition(playerWithTwoPositions2, playerWithTwoPositions2.getPositionFirst().intValue());
            } else if (auxSecond2 == null) {
                tactic.setReservePosition(playerWithTwoPositions2, playerWithTwoPositions2.getPositionSecond().intValue());
            } else {
                double difFirst2 = playerWithTwoPositions2.getMatchValue(playerWithTwoPositions2.getPositionFirst()).doubleValue() - auxFirst2.getMatchValue(playerWithTwoPositions2.getPositionFirst()).doubleValue();
                double difSecond2 = playerWithTwoPositions2.getMatchValue(playerWithTwoPositions2.getPositionSecond()).doubleValue() - auxSecond2.getMatchValue(playerWithTwoPositions2.getPositionSecond()).doubleValue();
                if (difFirst2 > 0.0d || difSecond2 > 0.0d) {
                    if (difFirst2 >= difSecond2) {
                        worst = auxFirst2;
                    } else {
                        worst = auxSecond2;
                    }
                    tactic.setReservePosition(playerWithTwoPositions2, tactic.getTitularPosition(worst).intValue());
                }
            }
        }
        if (!validateTeam(team)) {
            if (tactic.getLineupTitularPointGuard() == null && (bestPlayer10 = getBestPlayer(team)) != null) {
                tactic.setLineupTitularPointGuard(bestPlayer10.getId());
            }
            if (tactic.getLineupTitularShootingGuard() == null && (bestPlayer9 = getBestPlayer(team)) != null) {
                tactic.setLineupTitularShootingGuard(bestPlayer9.getId());
            }
            if (tactic.getLineupTitularSmallForward() == null && (bestPlayer8 = getBestPlayer(team)) != null) {
                tactic.setLineupTitularSmallForward(bestPlayer8.getId());
            }
            if (tactic.getLineupTitularPowerForward() == null && (bestPlayer7 = getBestPlayer(team)) != null) {
                tactic.setLineupTitularPowerForward(bestPlayer7.getId());
            }
            if (tactic.getLineupTitularCenter() == null && (bestPlayer6 = getBestPlayer(team)) != null) {
                tactic.setLineupTitularCenter(bestPlayer6.getId());
            }
            if (tactic.getLineupReservePointGuard() == null && (bestPlayer5 = getBestPlayer(team)) != null) {
                tactic.setLineupReservePointGuard(bestPlayer5.getId());
            }
            if (tactic.getLineupReserveShootingGuard() == null && (bestPlayer4 = getBestPlayer(team)) != null) {
                tactic.setLineupReserveShootingGuard(bestPlayer4.getId());
            }
            if (tactic.getLineupReserveSmallForward() == null && (bestPlayer3 = getBestPlayer(team)) != null) {
                tactic.setLineupReserveSmallForward(bestPlayer3.getId());
            }
            if (tactic.getLineupReservePowerForward() == null && (bestPlayer2 = getBestPlayer(team)) != null) {
                tactic.setLineupReservePowerForward(bestPlayer2.getId());
            }
            if (tactic.getLineupReserveCenter() == null && (bestPlayer = getBestPlayer(team)) != null) {
                tactic.setLineupReserveCenter(bestPlayer.getId());
            }
        }
        List<Player> lineupPlayers = team.getTactic().getPlayersInLineup();
        Collections.sort(lineupPlayers, new PlayerComparator(0, -1));
        for (Player obj : lineupPlayers) {
            if (tactic.getTacticStarOne() == null) {
                tactic.setTacticStarOne(obj.getId());
            } else if (tactic.getTacticStarTwo() == null) {
                tactic.setTacticStarTwo(obj.getId());
            } else if (tactic.getTacticStarThree() != null) {
                break;
            } else {
                tactic.setTacticStarThree(obj.getId());
            }
        }
        BlankDao.saveOrUpdate(tactic);
        tactic.reloadPlayers();
    }

    private static Player getBestPlayerForPositionFirst(Team team, int pos, int minEnergy) {
        Double bestValue = Double.valueOf(0.0d);
        Player bestPlayer = null;
        for (Player player : team.getTactic().getPlayersRemains()) {
            if (player.getPositionFirst().intValue() == pos && player.getStateInjury().intValue() == 0 && player.getStateEnergy().intValue() >= minEnergy && player.getMatchValue(null).doubleValue() > bestValue.doubleValue()) {
                bestValue = player.getMatchValue(null);
                bestPlayer = player;
            }
        }
        return bestPlayer;
    }

    private static Player getBestPlayer(Team team) {
        Double bestValue = Double.valueOf(0.0d);
        Player bestPlayer = null;
        for (Player player : team.getTactic().getPlayersRemains()) {
            if (player.getStateInjury().intValue() == 0 && player.getMatchValue(null).doubleValue() > bestValue.doubleValue()) {
                bestValue = player.getMatchValue(null);
                bestPlayer = player;
            }
        }
        return bestPlayer;
    }

    private static List<Player> getPlayersWithTwoPositions(Team team, int minEnergy) {
        List<Player> players = new ArrayList<>();
        for (Player player : team.getTactic().getPlayersRemains()) {
            if (player.getPositionSecond().intValue() != 0 && player.getStateInjury().intValue() == 0 && player.getStateEnergy().intValue() >= minEnergy) {
                players.add(player);
            }
        }
        return players;
    }

    private static Boolean validatePlayerInTeam(Team team, Integer matchPositionPlayerId) {
        if (matchPositionPlayerId == null || matchPositionPlayerId.intValue() == 0) {
            return Boolean.FALSE;
        }
        for (Player player : team.getTactic().getPlayers()) {
            if (player.getId() != null && player.getId().intValue() == matchPositionPlayerId.intValue() && player.getStateInjury().intValue() == 0) {
                return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    }
}
