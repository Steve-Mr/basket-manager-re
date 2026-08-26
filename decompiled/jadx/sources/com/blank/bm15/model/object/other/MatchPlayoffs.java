package com.blank.bm15.model.object.other;

import android.content.Context;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.object.crud.Team;

/* JADX INFO: loaded from: classes.dex */
public class MatchPlayoffs extends BlankBase {
    private Integer conference;
    private Integer resultLocal;
    private Integer resultVisitor;
    private Team teamLocal;
    private Integer teamLocalPositionConference;
    private Team teamVisitor;
    private Integer teamVisitorPositionConference;

    public MatchPlayoffs(Context context) {
        super(context);
    }

    public Integer getConference() {
        return this.conference;
    }

    public void setConference(Integer conference) {
        this.conference = conference;
    }

    public Team getTeamLocal() {
        if (this.teamLocal == null) {
            this.teamLocal = new Team(getContext());
        }
        return this.teamLocal;
    }

    public void setTeamLocal(Team teamLocal) {
        this.teamLocal = teamLocal;
    }

    public Team getTeamVisitor() {
        if (this.teamVisitor == null) {
            this.teamVisitor = new Team(getContext());
        }
        return this.teamVisitor;
    }

    public void setTeamVisitor(Team teamVisitor) {
        this.teamVisitor = teamVisitor;
    }

    public Integer getResultLocal() {
        if (this.resultLocal == null) {
            this.resultLocal = 0;
        }
        return this.resultLocal;
    }

    public void setResultLocal(Integer resultLocal) {
        this.resultLocal = resultLocal;
    }

    public Integer getResultVisitor() {
        if (this.resultVisitor == null) {
            this.resultVisitor = 0;
        }
        return this.resultVisitor;
    }

    public void setResultVisitor(Integer resultVisitor) {
        this.resultVisitor = resultVisitor;
    }

    public Integer getTeamLocalPositionConference() {
        return this.teamLocalPositionConference;
    }

    public void setTeamLocalPositionConference(Integer teamLocalPositionConference) {
        this.teamLocalPositionConference = teamLocalPositionConference;
    }

    public Integer getTeamVisitorPositionConference() {
        return this.teamVisitorPositionConference;
    }

    public void setTeamVisitorPositionConference(Integer teamVisitorPositionConference) {
        this.teamVisitorPositionConference = teamVisitorPositionConference;
    }
}
