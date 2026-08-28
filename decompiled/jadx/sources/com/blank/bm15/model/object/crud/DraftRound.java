package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* JADX INFO: loaded from: classes.dex */
public class DraftRound extends BlankBase {
    private Game game;
    private Double marketValue;
    private Integer position;
    private Integer round;
    private Team teamOwner;
    private Team teamUser;

    public DraftRound(Context context) {
        super(context);
    }

    public Integer getRound() {
        return this.round;
    }

    public void setRound(Integer round) {
        this.round = round;
    }

    public Integer getPosition() {
        if (this.position == null) {
            this.position = 100;
        }
        return this.position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Double getMarketValue() {
        return this.marketValue;
    }

    public void setMarketValue(Double marketValue) {
        this.marketValue = marketValue;
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

    public Team getTeamOwner() {
        if (this.teamOwner == null) {
            this.teamOwner = new Team(getContext());
        } else if (this.teamOwner.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.teamOwner);
        }
        return this.teamOwner;
    }

    public void setTeamOwner(Team teamOwner) {
        this.teamOwner = teamOwner;
    }

    public Team getTeamUser() {
        if (this.teamUser == null) {
            this.teamUser = new Team(getContext());
        } else if (this.teamUser.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.teamUser);
        }
        return this.teamUser;
    }

    public void setTeamUser(Team teamUser) {
        this.teamUser = teamUser;
    }
}
