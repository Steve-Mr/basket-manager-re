package com.blank.bm15.model.object.other;

import com.blank.bm15.model.object.crud.Playoffs;

/* JADX INFO: loaded from: classes.dex */
public class MatchdayCalendar {
    private Integer matchday;
    private String teamLocal;
    private String teamVisitor;

    public MatchdayCalendar(Integer matchday, String teamLocal, String teamVisitor) {
        this.matchday = matchday;
        this.teamLocal = teamLocal;
        this.teamVisitor = teamVisitor;
    }

    public MatchdayCalendar(Integer matchday, Playoffs teamA, Playoffs teamB, Boolean isLocal) {
        this.matchday = matchday;
        if (teamA.getGamesWon().intValue() > teamB.getGamesWon().intValue()) {
            this.teamLocal = isLocal.booleanValue() ? teamA.getTeam().getName() : teamB.getTeam().getName();
            this.teamVisitor = isLocal.booleanValue() ? teamB.getTeam().getName() : teamA.getTeam().getName();
            return;
        }
        if (teamA.getGamesWon().intValue() < teamB.getGamesWon().intValue()) {
            this.teamVisitor = isLocal.booleanValue() ? teamA.getTeam().getName() : teamB.getTeam().getName();
            this.teamLocal = isLocal.booleanValue() ? teamB.getTeam().getName() : teamA.getTeam().getName();
            return;
        }
        if (teamA.getPointsDiff().intValue() > teamB.getPointsDiff().intValue()) {
            this.teamLocal = isLocal.booleanValue() ? teamA.getTeam().getName() : teamB.getTeam().getName();
            this.teamVisitor = isLocal.booleanValue() ? teamB.getTeam().getName() : teamA.getTeam().getName();
        } else if (teamA.getPointsDiff().intValue() < teamB.getPointsDiff().intValue()) {
            this.teamVisitor = isLocal.booleanValue() ? teamA.getTeam().getName() : teamB.getTeam().getName();
            this.teamLocal = isLocal.booleanValue() ? teamB.getTeam().getName() : teamA.getTeam().getName();
        } else if (teamA.getPointsScored().intValue() >= teamB.getPointsScored().intValue()) {
            this.teamLocal = isLocal.booleanValue() ? teamA.getTeam().getName() : teamB.getTeam().getName();
            this.teamVisitor = isLocal.booleanValue() ? teamB.getTeam().getName() : teamA.getTeam().getName();
        } else {
            this.teamVisitor = isLocal.booleanValue() ? teamA.getTeam().getName() : teamB.getTeam().getName();
            this.teamLocal = isLocal.booleanValue() ? teamB.getTeam().getName() : teamA.getTeam().getName();
        }
    }

    public Integer getMatchday() {
        return this.matchday;
    }

    public void setMatchday(Integer matchday) {
        this.matchday = matchday;
    }

    public String getTeamLocal() {
        return this.teamLocal;
    }

    public void setTeamLocal(String teamLocal) {
        this.teamLocal = teamLocal;
    }

    public String getTeamVisitor() {
        return this.teamVisitor;
    }

    public void setTeamVisitor(String teamVisitor) {
        this.teamVisitor = teamVisitor;
    }
}
