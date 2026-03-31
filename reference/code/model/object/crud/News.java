package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* loaded from: classes.dex */
public class News extends BlankBase {
    private String body;
    private Game game;
    private Integer matchday;
    private Player player1;
    private Player player2;
    private Player player3;
    private Player player4;
    private Team team1;
    private Team team2;
    private String title;
    private Integer type;

    public News(Context context) {
        super(context);
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return this.body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Integer getType() {
        return this.type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getMatchday() {
        return this.matchday;
    }

    public void setMatchday(Integer matchday) {
        this.matchday = matchday;
    }

    public Team getTeam1() {
        if (this.team1 == null) {
            this.team1 = new Team(getContext());
        } else if (this.team1.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.team1);
        }
        return this.team1;
    }

    public void setTeam1(Team team1) {
        this.team1 = team1;
    }

    public Team getTeam2() {
        if (this.team2 == null) {
            this.team2 = new Team(getContext());
        } else if (this.team2.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.team2);
        }
        return this.team2;
    }

    public void setTeam2(Team team2) {
        this.team2 = team2;
    }

    public Player getPlayer1() {
        if (this.player1 == null) {
            this.player1 = new Player(getContext());
        } else if (this.player1.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.player1);
        }
        return this.player1;
    }

    public void setPlayer1(Player player1) {
        this.player1 = player1;
    }

    public Player getPlayer2() {
        if (this.player2 == null) {
            this.player2 = new Player(getContext());
        } else if (this.player2.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.player2);
        }
        return this.player2;
    }

    public void setPlayer2(Player player2) {
        this.player2 = player2;
    }

    public Player getPlayer3() {
        if (this.player3 == null) {
            this.player3 = new Player(getContext());
        } else if (this.player3.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.player3);
        }
        return this.player3;
    }

    public void setPlayer3(Player player3) {
        this.player3 = player3;
    }

    public Player getPlayer4() {
        if (this.player4 == null) {
            this.player4 = new Player(getContext());
        } else if (this.player4.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.player4);
        }
        return this.player4;
    }

    public void setPlayer4(Player player4) {
        this.player4 = player4;
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
}
