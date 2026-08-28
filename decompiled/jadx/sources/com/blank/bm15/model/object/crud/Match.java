package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* JADX INFO: loaded from: classes.dex */
public class Match extends BlankBase {
    private Game game;
    private Integer localExtension;
    private Integer localQuarterFirst;
    private Integer localQuarterFourth;
    private Integer localQuarterSecond;
    private Integer localQuarterThird;
    private Integer matchday;
    private String name;
    private Team teamLocal;
    private Team teamVisitor;
    private Integer visitorExtension;
    private Integer visitorQuarterFirst;
    private Integer visitorQuarterFourth;
    private Integer visitorQuarterSecond;
    private Integer visitorQuarterThird;

    public Match(Context context) {
        super(context);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getMatchday() {
        return this.matchday;
    }

    public void setMatchday(Integer matchday) {
        this.matchday = matchday;
    }

    public Integer getLocalQuarterFirst() {
        if (this.localQuarterFirst == null) {
            this.localQuarterFirst = 0;
        }
        return this.localQuarterFirst;
    }

    public void setLocalQuarterFirst(Integer localQuarterFirst) {
        this.localQuarterFirst = localQuarterFirst;
    }

    public Integer getLocalQuarterSecond() {
        if (this.localQuarterSecond == null) {
            this.localQuarterSecond = 0;
        }
        return this.localQuarterSecond;
    }

    public void setLocalQuarterSecond(Integer localQuarterSecond) {
        this.localQuarterSecond = localQuarterSecond;
    }

    public Integer getLocalQuarterThird() {
        if (this.localQuarterThird == null) {
            this.localQuarterThird = 0;
        }
        return this.localQuarterThird;
    }

    public void setLocalQuarterThird(Integer localQuarterThird) {
        this.localQuarterThird = localQuarterThird;
    }

    public Integer getLocalQuarterFourth() {
        if (this.localQuarterFourth == null) {
            this.localQuarterFourth = 0;
        }
        return this.localQuarterFourth;
    }

    public void setLocalQuarterFourth(Integer localQuarterFourth) {
        this.localQuarterFourth = localQuarterFourth;
    }

    public Integer getLocalExtension() {
        if (this.localExtension == null) {
            this.localExtension = 0;
        }
        return this.localExtension;
    }

    public void setLocalExtension(Integer localExtension) {
        this.localExtension = localExtension;
    }

    public Integer getVisitorQuarterFirst() {
        if (this.visitorQuarterFirst == null) {
            this.visitorQuarterFirst = 0;
        }
        return this.visitorQuarterFirst;
    }

    public void setVisitorQuarterFirst(Integer visitorQuarterFirst) {
        this.visitorQuarterFirst = visitorQuarterFirst;
    }

    public Integer getVisitorQuarterSecond() {
        if (this.visitorQuarterSecond == null) {
            this.visitorQuarterSecond = 0;
        }
        return this.visitorQuarterSecond;
    }

    public void setVisitorQuarterSecond(Integer visitorQuarterSecond) {
        this.visitorQuarterSecond = visitorQuarterSecond;
    }

    public Integer getVisitorQuarterThird() {
        if (this.visitorQuarterThird == null) {
            this.visitorQuarterThird = 0;
        }
        return this.visitorQuarterThird;
    }

    public void setVisitorQuarterThird(Integer visitorQuarterThird) {
        this.visitorQuarterThird = visitorQuarterThird;
    }

    public Integer getVisitorQuarterFourth() {
        if (this.visitorQuarterFourth == null) {
            this.visitorQuarterFourth = 0;
        }
        return this.visitorQuarterFourth;
    }

    public void setVisitorQuarterFourth(Integer visitorQuarterFourth) {
        this.visitorQuarterFourth = visitorQuarterFourth;
    }

    public Integer getVisitorExtension() {
        if (this.visitorExtension == null) {
            this.visitorExtension = 0;
        }
        return this.visitorExtension;
    }

    public void setVisitorExtension(Integer visitorExtension) {
        this.visitorExtension = visitorExtension;
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

    public Team getTeamLocal() {
        if (this.teamLocal == null) {
            this.teamLocal = new Team(getContext());
        } else if (this.teamLocal.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.teamLocal);
        }
        return this.teamLocal;
    }

    public void setTeamLocal(Team teamLocal) {
        this.teamLocal = teamLocal;
    }

    public Team getTeamVisitor() {
        if (this.teamVisitor == null) {
            this.teamVisitor = new Team(getContext());
        } else if (this.teamVisitor.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.teamVisitor);
        }
        return this.teamVisitor;
    }

    public void setTeamVisitor(Team teamVisitor) {
        this.teamVisitor = teamVisitor;
    }

    public Integer getFinalResultLocal() {
        return Integer.valueOf(getLocalQuarterFirst().intValue() + getLocalQuarterSecond().intValue() + getLocalQuarterThird().intValue() + getLocalQuarterFourth().intValue() + getLocalExtension().intValue());
    }

    public Integer getFinalResultVisitor() {
        return Integer.valueOf(getVisitorQuarterFirst().intValue() + getVisitorQuarterSecond().intValue() + getVisitorQuarterThird().intValue() + getVisitorQuarterFourth().intValue() + getVisitorExtension().intValue());
    }

    public Integer getTotalPointsLocalPlayers() {
        int total = 0;
        for (Player player : getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null) {
                total += player.getCurrentMatchResult().getPoints().intValue();
            }
        }
        return Integer.valueOf(total);
    }

    public Integer getTotalPointsVisitorPlayers() {
        int total = 0;
        for (Player player : getTeamVisitor().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null) {
                total += player.getCurrentMatchResult().getPoints().intValue();
            }
        }
        return Integer.valueOf(total);
    }

    public Boolean getIsMathOfUserTeam(Game game) {
        return getTeamLocal().getId().intValue() == game.getUserTeam().getId().intValue() || getTeamVisitor().getId().intValue() == game.getUserTeam().getId().intValue();
    }

    public Team getTeamWinner() {
        return getFinalResultLocal().intValue() > getFinalResultVisitor().intValue() ? getTeamLocal() : getTeamVisitor();
    }

    public Player getMvp() {
        Player mvpPlayer = null;
        double mvpPer = 0.0d;
        for (Player player : getTeamWinner().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null && player.getCurrentMatchResult().getMinutesPlayed().intValue() >= 24 && mvpPer < player.getCurrentMatchResult().getPer().doubleValue()) {
                mvpPer = player.getCurrentMatchResult().getPer().doubleValue();
                mvpPlayer = player;
            }
        }
        if (mvpPlayer == null) {
            Player mvpPlayer2 = new Player(getContext());
            return mvpPlayer2;
        }
        return mvpPlayer;
    }

    public Player getMaxPts() {
        Player maxPtsPlayer = null;
        int maxPts = 0;
        for (Player player : getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null && maxPts < player.getCurrentMatchResult().getPoints().intValue()) {
                maxPts = player.getCurrentMatchResult().getPoints().intValue();
                maxPtsPlayer = player;
            }
        }
        for (Player player2 : getTeamVisitor().getTactic().getPlayers()) {
            if (player2.getIsInLineup().booleanValue() && player2.getCurrentMatchResult() != null && maxPts < player2.getCurrentMatchResult().getPoints().intValue()) {
                maxPts = player2.getCurrentMatchResult().getPoints().intValue();
                maxPtsPlayer = player2;
            }
        }
        if (maxPtsPlayer == null) {
            Player maxPtsPlayer2 = new Player(getContext());
            return maxPtsPlayer2;
        }
        return maxPtsPlayer;
    }

    public Player getMaxReb() {
        Player maxRebPlayer = null;
        double maxReb = 0.0d;
        for (Player player : getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null && maxReb < player.getCurrentMatchResult().getRebounds().doubleValue()) {
                maxReb = player.getCurrentMatchResult().getRebounds().doubleValue();
                maxRebPlayer = player;
            }
        }
        for (Player player2 : getTeamVisitor().getTactic().getPlayers()) {
            if (player2.getIsInLineup().booleanValue() && player2.getCurrentMatchResult() != null && maxReb < player2.getCurrentMatchResult().getRebounds().doubleValue()) {
                maxReb = player2.getCurrentMatchResult().getRebounds().doubleValue();
                maxRebPlayer = player2;
            }
        }
        if (maxRebPlayer == null) {
            Player maxRebPlayer2 = new Player(getContext());
            MatchResult fakeMatchResult = new MatchResult(getContext());
            fakeMatchResult.setRebounds(Double.valueOf(0.0d));
            maxRebPlayer2.setCurrentMatchResult(fakeMatchResult);
            return maxRebPlayer2;
        }
        return maxRebPlayer;
    }

    public Player getMaxAst() {
        Player maxAstPlayer = null;
        double maxAst = 0.0d;
        for (Player player : getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null && maxAst < player.getCurrentMatchResult().getPassesOk().doubleValue()) {
                maxAst = player.getCurrentMatchResult().getPassesOk().doubleValue();
                maxAstPlayer = player;
            }
        }
        for (Player player2 : getTeamVisitor().getTactic().getPlayers()) {
            if (player2.getIsInLineup().booleanValue() && player2.getCurrentMatchResult() != null && maxAst < player2.getCurrentMatchResult().getPassesOk().doubleValue()) {
                maxAst = player2.getCurrentMatchResult().getPassesOk().doubleValue();
                maxAstPlayer = player2;
            }
        }
        if (maxAstPlayer == null) {
            Player maxAstPlayer2 = new Player(getContext());
            MatchResult fakeMatchResult = new MatchResult(getContext());
            fakeMatchResult.setPassesOk(Double.valueOf(0.0d));
            maxAstPlayer2.setCurrentMatchResult(fakeMatchResult);
            return maxAstPlayer2;
        }
        return maxAstPlayer;
    }

    public Player getMaxStl() {
        Player maxStlPlayer = null;
        double maxStl = 0.0d;
        for (Player player : getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null && maxStl < player.getCurrentMatchResult().getSteals().doubleValue()) {
                maxStl = player.getCurrentMatchResult().getSteals().doubleValue();
                maxStlPlayer = player;
            }
        }
        for (Player player2 : getTeamVisitor().getTactic().getPlayers()) {
            if (player2.getIsInLineup().booleanValue() && player2.getCurrentMatchResult() != null && maxStl < player2.getCurrentMatchResult().getSteals().doubleValue()) {
                maxStl = player2.getCurrentMatchResult().getSteals().doubleValue();
                maxStlPlayer = player2;
            }
        }
        if (maxStlPlayer == null) {
            Player maxStlPlayer2 = new Player(getContext());
            MatchResult fakeMatchResult = new MatchResult(getContext());
            fakeMatchResult.setSteals(Double.valueOf(0.0d));
            maxStlPlayer2.setCurrentMatchResult(fakeMatchResult);
            return maxStlPlayer2;
        }
        return maxStlPlayer;
    }

    public Player getMaxBlk() {
        Player maxBlkPlayer = null;
        double maxBlk = 0.0d;
        for (Player player : getTeamLocal().getTactic().getPlayers()) {
            if (player.getIsInLineup().booleanValue() && player.getCurrentMatchResult() != null && maxBlk < player.getCurrentMatchResult().getBlocks().doubleValue()) {
                maxBlk = player.getCurrentMatchResult().getBlocks().doubleValue();
                maxBlkPlayer = player;
            }
        }
        for (Player player2 : getTeamVisitor().getTactic().getPlayers()) {
            if (player2.getIsInLineup().booleanValue() && player2.getCurrentMatchResult() != null && maxBlk < player2.getCurrentMatchResult().getBlocks().doubleValue()) {
                maxBlk = player2.getCurrentMatchResult().getBlocks().doubleValue();
                maxBlkPlayer = player2;
            }
        }
        if (maxBlkPlayer == null) {
            Player maxBlkPlayer2 = new Player(getContext());
            MatchResult fakeMatchResult = new MatchResult(getContext());
            fakeMatchResult.setBlocks(Double.valueOf(0.0d));
            maxBlkPlayer2.setCurrentMatchResult(fakeMatchResult);
            return maxBlkPlayer2;
        }
        return maxBlkPlayer;
    }
}
