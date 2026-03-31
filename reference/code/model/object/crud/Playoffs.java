package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* loaded from: classes.dex */
public class Playoffs extends BlankBase {
    private Integer conference;
    private Game game;
    private Integer gamesWon;
    private Integer pointsDiff;
    private Integer pointsScored;
    private Integer position;
    private Integer seriesGamesWon;
    private Team team;

    public Playoffs(Context context) {
        super(context);
    }

    public Integer getConference() {
        return this.conference;
    }

    public void setConference(Integer conference) {
        this.conference = conference;
    }

    public Integer getPosition() {
        return this.position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getGamesWon() {
        return this.gamesWon;
    }

    public void setGamesWon(Integer gamesWon) {
        this.gamesWon = gamesWon;
    }

    public Integer getPointsDiff() {
        return this.pointsDiff;
    }

    public void setPointsDiff(Integer pointsDiff) {
        this.pointsDiff = pointsDiff;
    }

    public Integer getPointsScored() {
        return this.pointsScored;
    }

    public void setPointsScored(Integer pointsScored) {
        this.pointsScored = pointsScored;
    }

    public Integer getSeriesGamesWon() {
        if (this.seriesGamesWon == null) {
            this.seriesGamesWon = 0;
        }
        return this.seriesGamesWon;
    }

    public void setSeriesGamesWon(Integer seriesGamesWon) {
        this.seriesGamesWon = seriesGamesWon;
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
            this.team.setGame(getGame());
        } else if (this.team.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.team);
        }
        return this.team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public void addSeriesGamesWon() {
        setSeriesGamesWon(Integer.valueOf(getSeriesGamesWon().intValue() + 1));
    }

    public Boolean getIsInSeriesSemis() {
        return getSeriesGamesWon().intValue() >= 4;
    }

    public Boolean getIsInSeriesConferenceFinal() {
        return getSeriesGamesWon().intValue() >= 8;
    }

    public Boolean getIsInSeriesWorldFinal() {
        return getSeriesGamesWon().intValue() >= 12;
    }

    public Boolean getIsChampion() {
        return getSeriesGamesWon().intValue() == 16;
    }
}
