package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* loaded from: classes.dex */
public class Game extends BlankBase {
    private Integer currentMatchday;
    private Integer currentSeason;
    private String name;
    private Boolean tempCreateOnlinePlayersOk;
    private Team userTeam;

    public Game(Context context) {
        super(context);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCurrentSeason() {
        if (this.currentSeason == null) {
            this.currentSeason = 1;
        }
        return this.currentSeason;
    }

    public void setCurrentSeason(Integer currentSeason) {
        this.currentSeason = currentSeason;
    }

    public Integer getCurrentMatchday() {
        if (this.currentMatchday == null) {
            this.currentMatchday = 1;
        }
        return this.currentMatchday;
    }

    public void setCurrentMatchday(Integer currentMatchday) {
        this.currentMatchday = currentMatchday;
    }

    public Team getUserTeam() {
        if (this.userTeam == null) {
            this.userTeam = new Team(getContext());
        } else if (this.userTeam.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.userTeam);
            this.userTeam.setGame(this);
        }
        return this.userTeam;
    }

    public void setUserTeam(Team userTeam) {
        this.userTeam = userTeam;
    }

    public Boolean getCreateOnlinePlayersOk() {
        if (this.tempCreateOnlinePlayersOk == null) {
            this.tempCreateOnlinePlayersOk = Boolean.TRUE;
        }
        return this.tempCreateOnlinePlayersOk;
    }

    public void setCreateOnlinePlayersOk(Boolean tempCreateOnlinePlayersOk) {
        this.tempCreateOnlinePlayersOk = tempCreateOnlinePlayersOk;
    }
}
