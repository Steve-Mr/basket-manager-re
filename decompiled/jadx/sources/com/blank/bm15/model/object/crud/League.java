package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* JADX INFO: loaded from: classes.dex */
public class League extends BlankBase {
    private Game game;
    private Integer gamesLost;
    private Integer gamesWon;
    private Integer pointsAllowed;
    private Integer pointsScored;
    private Team team;

    public League(Context context) {
        super(context);
    }

    public Integer getGamesWon() {
        if (this.gamesWon == null) {
            this.gamesWon = 0;
        }
        return this.gamesWon;
    }

    public void setGamesWon(Integer gamesWon) {
        this.gamesWon = gamesWon;
    }

    public Integer getGamesLost() {
        if (this.gamesLost == null) {
            this.gamesLost = 0;
        }
        return this.gamesLost;
    }

    public void setGamesLost(Integer gamesLost) {
        this.gamesLost = gamesLost;
    }

    public Integer getPointsScored() {
        if (this.pointsScored == null) {
            this.pointsScored = 0;
        }
        return this.pointsScored;
    }

    public void setPointsScored(Integer pointsScored) {
        this.pointsScored = pointsScored;
    }

    public Integer getPointsAllowed() {
        if (this.pointsAllowed == null) {
            this.pointsAllowed = 0;
        }
        return this.pointsAllowed;
    }

    public void setPointsAllowed(Integer pointsAllowed) {
        this.pointsAllowed = pointsAllowed;
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
}
