package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.comparator.PlayerComparator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class Tactic extends BlankBase {
    private Game game;
    private Integer lineupReserveCenter;
    private Integer lineupReservePointGuard;
    private Integer lineupReservePowerForward;
    private Integer lineupReserveShootingGuard;
    private Integer lineupReserveSmallForward;
    private Integer lineupTitularCenter;
    private Integer lineupTitularPointGuard;
    private Integer lineupTitularPowerForward;
    private Integer lineupTitularShootingGuard;
    private Integer lineupTitularSmallForward;
    private Integer tacticBenchImportance;
    private Integer tacticGameType;
    private Integer tacticShotIntPercent;
    private Integer tacticShotTriplePercent;
    private Integer tacticStarOne;
    private Integer tacticStarThree;
    private Integer tacticStarTwo;
    private Team team;
    private List<Player> tempPlayers;

    public Tactic(Context context) {
        super(context);
    }

    public Integer getLineupTitularPointGuard() {
        return this.lineupTitularPointGuard;
    }

    public void setLineupTitularPointGuard(Integer lineupTitularPointGuard) {
        this.lineupTitularPointGuard = lineupTitularPointGuard;
    }

    public Integer getLineupTitularShootingGuard() {
        return this.lineupTitularShootingGuard;
    }

    public void setLineupTitularShootingGuard(Integer lineupTitularShootingGuard) {
        this.lineupTitularShootingGuard = lineupTitularShootingGuard;
    }

    public Integer getLineupTitularSmallForward() {
        return this.lineupTitularSmallForward;
    }

    public void setLineupTitularSmallForward(Integer lineupTitularSmallForward) {
        this.lineupTitularSmallForward = lineupTitularSmallForward;
    }

    public Integer getLineupTitularPowerForward() {
        return this.lineupTitularPowerForward;
    }

    public void setLineupTitularPowerForward(Integer lineupTitularPowerForward) {
        this.lineupTitularPowerForward = lineupTitularPowerForward;
    }

    public Integer getLineupTitularCenter() {
        return this.lineupTitularCenter;
    }

    public void setLineupTitularCenter(Integer lineupTitularCenter) {
        this.lineupTitularCenter = lineupTitularCenter;
    }

    public Integer getLineupReservePointGuard() {
        return this.lineupReservePointGuard;
    }

    public void setLineupReservePointGuard(Integer lineupReservePointGuard) {
        this.lineupReservePointGuard = lineupReservePointGuard;
    }

    public Integer getLineupReserveShootingGuard() {
        return this.lineupReserveShootingGuard;
    }

    public void setLineupReserveShootingGuard(Integer lineupReserveShootingGuard) {
        this.lineupReserveShootingGuard = lineupReserveShootingGuard;
    }

    public Integer getLineupReserveSmallForward() {
        return this.lineupReserveSmallForward;
    }

    public void setLineupReserveSmallForward(Integer lineupReserveSmallForward) {
        this.lineupReserveSmallForward = lineupReserveSmallForward;
    }

    public Integer getLineupReservePowerForward() {
        return this.lineupReservePowerForward;
    }

    public void setLineupReservePowerForward(Integer lineupReservePowerForward) {
        this.lineupReservePowerForward = lineupReservePowerForward;
    }

    public Integer getLineupReserveCenter() {
        return this.lineupReserveCenter;
    }

    public void setLineupReserveCenter(Integer lineupReserveCenter) {
        this.lineupReserveCenter = lineupReserveCenter;
    }

    public Integer getTacticBenchImportance() {
        if (this.tacticBenchImportance == null) {
            this.tacticBenchImportance = 3;
        }
        return this.tacticBenchImportance;
    }

    public void setTacticBenchImportance(Integer tacticBenchImportance) {
        this.tacticBenchImportance = tacticBenchImportance;
    }

    public Integer getTacticGameType() {
        if (this.tacticGameType == null) {
            this.tacticGameType = 0;
        }
        return this.tacticGameType;
    }

    public void setTacticGameType(Integer tacticGameType) {
        this.tacticGameType = tacticGameType;
    }

    public Integer getTacticShotIntPercent() {
        if (this.tacticShotIntPercent == null) {
            this.tacticShotIntPercent = 40;
        }
        return this.tacticShotIntPercent;
    }

    public void setTacticShotIntPercent(Integer tacticShotIntPercent) {
        this.tacticShotIntPercent = tacticShotIntPercent;
    }

    public Integer getTacticShotTriplePercent() {
        if (this.tacticShotTriplePercent == null) {
            this.tacticShotTriplePercent = 40;
        }
        return this.tacticShotTriplePercent;
    }

    public void setTacticShotTriplePercent(Integer tacticShotTriplePercent) {
        this.tacticShotTriplePercent = tacticShotTriplePercent;
    }

    public Integer getTacticStarOne() {
        return this.tacticStarOne;
    }

    public void setTacticStarOne(Integer tacticStarOne) {
        this.tacticStarOne = tacticStarOne;
    }

    public Integer getTacticStarTwo() {
        return this.tacticStarTwo;
    }

    public void setTacticStarTwo(Integer tacticStarTwo) {
        this.tacticStarTwo = tacticStarTwo;
    }

    public Integer getTacticStarThree() {
        return this.tacticStarThree;
    }

    public void setTacticStarThree(Integer tacticStarThree) {
        this.tacticStarThree = tacticStarThree;
    }

    public Game getGame() {
        if (this.game == null) {
            this.game = new Game(getContext());
        } else if (this.game.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.game);
        }
        return this.game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Team getTeam() {
        if (this.team == null) {
            this.team = new Team(getContext());
        } else if (this.team.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.team);
        }
        return this.team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public List<Player> getPlayers() {
        if (this.tempPlayers == null) {
            Player filter = new Player(getContext());
            filter.setTeam(getTeam());
            this.tempPlayers = BlankDao.getSome(filter);
            for (Player player : this.tempPlayers) {
                player.setGame(getGame());
                player.setTeam(getTeam());
                if (getTacticStarOne() != null && player.getId().intValue() == getTacticStarOne().intValue()) {
                    player.setIsStarOne(Boolean.TRUE);
                } else {
                    player.setIsStarOne(Boolean.FALSE);
                }
                if (getTacticStarTwo() != null && player.getId().intValue() == getTacticStarTwo().intValue()) {
                    player.setIsStarTwo(Boolean.TRUE);
                } else {
                    player.setIsStarTwo(Boolean.FALSE);
                }
                if (getTacticStarThree() != null && player.getId().intValue() == getTacticStarThree().intValue()) {
                    player.setIsStarThree(Boolean.TRUE);
                } else {
                    player.setIsStarThree(Boolean.FALSE);
                }
                player.setPositionMatch(0);
                Integer position = getTitularPosition(player);
                if (position.intValue() != 0) {
                    player.setIsTitular(Boolean.TRUE);
                    player.setPositionMatch(position);
                } else {
                    player.setIsTitular(Boolean.FALSE);
                }
                Integer position2 = getReservePosition(player);
                if (position2.intValue() != 0) {
                    player.setIsReserve(Boolean.TRUE);
                    player.setPositionMatch(position2);
                } else {
                    player.setIsReserve(Boolean.FALSE);
                }
            }
        }
        return this.tempPlayers;
    }

    public void reloadPlayers() {
        this.tempPlayers = null;
        getPlayers();
    }

    public List<Player> getPlayersInLineup() {
        List<Player> players = getPlayersTitulars();
        for (Player player : getPlayersReserves()) {
            players.add(player);
        }
        return players;
    }

    public List<Player> getPlayersTitulars() {
        List<Player> titulars = new ArrayList<>();
        if (getLineupTitularPointGuard() != null) {
            Player player = findPlayer(getLineupTitularPointGuard());
            if (player == null) {
                setLineupTitularPointGuard(null);
            } else {
                titulars.add(player);
            }
        }
        if (getLineupTitularShootingGuard() != null) {
            Player player2 = findPlayer(getLineupTitularShootingGuard());
            if (player2 == null) {
                setLineupTitularShootingGuard(null);
            } else {
                titulars.add(player2);
            }
        }
        if (getLineupTitularSmallForward() != null) {
            Player player3 = findPlayer(getLineupTitularSmallForward());
            if (player3 == null) {
                setLineupTitularSmallForward(null);
            } else {
                titulars.add(player3);
            }
        }
        if (getLineupTitularPowerForward() != null) {
            Player player4 = findPlayer(getLineupTitularPowerForward());
            if (player4 == null) {
                setLineupTitularPowerForward(null);
            } else {
                titulars.add(player4);
            }
        }
        if (getLineupTitularCenter() != null) {
            Player player5 = findPlayer(getLineupTitularCenter());
            if (player5 == null) {
                setLineupTitularCenter(null);
            } else {
                titulars.add(player5);
            }
        }
        return titulars;
    }

    public List<Player> getPlayersReserves() {
        List<Player> reserves = new ArrayList<>();
        if (getLineupReservePointGuard() != null) {
            Player player = findPlayer(getLineupReservePointGuard());
            if (player == null) {
                setLineupReservePointGuard(null);
            } else {
                reserves.add(player);
            }
        }
        if (getLineupReserveShootingGuard() != null) {
            Player player2 = findPlayer(getLineupReserveShootingGuard());
            if (player2 == null) {
                setLineupReserveShootingGuard(null);
            } else {
                reserves.add(player2);
            }
        }
        if (getLineupReserveSmallForward() != null) {
            Player player3 = findPlayer(getLineupReserveSmallForward());
            if (player3 == null) {
                setLineupReserveSmallForward(null);
            } else {
                reserves.add(player3);
            }
        }
        if (getLineupReservePowerForward() != null) {
            Player player4 = findPlayer(getLineupReservePowerForward());
            if (player4 == null) {
                setLineupReservePowerForward(null);
            } else {
                reserves.add(player4);
            }
        }
        if (getLineupReserveCenter() != null) {
            Player player5 = findPlayer(getLineupReserveCenter());
            if (player5 == null) {
                setLineupReserveCenter(null);
            } else {
                reserves.add(player5);
            }
        }
        return reserves;
    }

    public List<Player> getPlayersRemains() {
        List<Player> remains = new ArrayList<>();
        Collections.sort(getPlayers(), new PlayerComparator(6, 1));
        for (Player player : getPlayers()) {
            if (getTitularPosition(player).intValue() == 0 && getReservePosition(player).intValue() == 0) {
                remains.add(player);
            }
        }
        return remains;
    }

    public Integer getTitularPosition(Player player) {
        if (getLineupTitularPointGuard() != null && getLineupTitularPointGuard().intValue() == player.getId().intValue()) {
            return 1;
        }
        if (getLineupTitularShootingGuard() != null && getLineupTitularShootingGuard().intValue() == player.getId().intValue()) {
            return 2;
        }
        if (getLineupTitularSmallForward() != null && getLineupTitularSmallForward().intValue() == player.getId().intValue()) {
            return 3;
        }
        if (getLineupTitularPowerForward() != null && getLineupTitularPowerForward().intValue() == player.getId().intValue()) {
            return 4;
        }
        if (getLineupTitularCenter() != null && getLineupTitularCenter().intValue() == player.getId().intValue()) {
            return 5;
        }
        return 0;
    }

    public void setTitularPosition(Player player, int position) {
        if (1 == position) {
            setLineupTitularPointGuard(player.getId());
            return;
        }
        if (2 == position) {
            setLineupTitularShootingGuard(player.getId());
            return;
        }
        if (3 == position) {
            setLineupTitularSmallForward(player.getId());
        } else if (4 == position) {
            setLineupTitularPowerForward(player.getId());
        } else if (5 == position) {
            setLineupTitularCenter(player.getId());
        }
    }

    public Integer getReservePosition(Player player) {
        if (getLineupReservePointGuard() != null && getLineupReservePointGuard().intValue() == player.getId().intValue()) {
            return 1;
        }
        if (getLineupReserveShootingGuard() != null && getLineupReserveShootingGuard().intValue() == player.getId().intValue()) {
            return 2;
        }
        if (getLineupReserveSmallForward() != null && getLineupReserveSmallForward().intValue() == player.getId().intValue()) {
            return 3;
        }
        if (getLineupReservePowerForward() != null && getLineupReservePowerForward().intValue() == player.getId().intValue()) {
            return 4;
        }
        if (getLineupReserveCenter() != null && getLineupReserveCenter().intValue() == player.getId().intValue()) {
            return 5;
        }
        return 0;
    }

    public void setReservePosition(Player player, int position) {
        if (1 == position) {
            setLineupReservePointGuard(player.getId());
            return;
        }
        if (2 == position) {
            setLineupReserveShootingGuard(player.getId());
            return;
        }
        if (3 == position) {
            setLineupReserveSmallForward(player.getId());
        } else if (4 == position) {
            setLineupReservePowerForward(player.getId());
        } else if (5 == position) {
            setLineupReserveCenter(player.getId());
        }
    }

    public Player getTitularPlayer(int position) {
        if (1 == position) {
            Player player = findPlayer(getLineupTitularPointGuard());
            return player;
        }
        if (2 == position) {
            Player player2 = findPlayer(getLineupTitularShootingGuard());
            return player2;
        }
        if (3 == position) {
            Player player3 = findPlayer(getLineupTitularSmallForward());
            return player3;
        }
        if (4 == position) {
            Player player4 = findPlayer(getLineupTitularPowerForward());
            return player4;
        }
        if (5 != position) {
            return null;
        }
        Player player5 = findPlayer(getLineupTitularCenter());
        return player5;
    }

    public Player getReservePlayer(int position) {
        if (1 == position) {
            Player player = findPlayer(getLineupReservePointGuard());
            return player;
        }
        if (2 == position) {
            Player player2 = findPlayer(getLineupReserveShootingGuard());
            return player2;
        }
        if (3 == position) {
            Player player3 = findPlayer(getLineupReserveSmallForward());
            return player3;
        }
        if (4 == position) {
            Player player4 = findPlayer(getLineupReservePowerForward());
            return player4;
        }
        if (5 != position) {
            return null;
        }
        Player player5 = findPlayer(getLineupReserveCenter());
        return player5;
    }

    private Player findPlayer(Integer idPlayer) {
        for (Player player : getPlayers()) {
            if (idPlayer != null && idPlayer.intValue() == player.getId().intValue()) {
                return player;
            }
        }
        return null;
    }
}
