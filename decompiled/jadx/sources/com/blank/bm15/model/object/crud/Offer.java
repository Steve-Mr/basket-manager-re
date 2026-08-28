package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* JADX INFO: loaded from: classes.dex */
public class Offer extends BlankBase {
    private Boolean answer;
    private Game game;
    private Integer matchday;
    private Player player;
    private Integer salary;
    private Team team;
    private Integer years;

    public Offer(Context context) {
        super(context);
    }

    public Integer getSalary() {
        return this.salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getYears() {
        return this.years;
    }

    public void setYears(Integer years) {
        this.years = years;
    }

    public Integer getMatchday() {
        return this.matchday;
    }

    public void setMatchday(Integer matchday) {
        this.matchday = matchday;
    }

    public Boolean getAnswer() {
        return this.answer;
    }

    public void setAnswer(Boolean answer) {
        this.answer = answer;
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

    public Player getPlayer() {
        if (this.player == null) {
            this.player = new Player(getContext());
        } else if (this.player.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.player);
        }
        return this.player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }
}
