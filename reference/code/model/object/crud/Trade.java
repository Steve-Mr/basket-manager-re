package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;

/* loaded from: classes.dex */
public class Trade extends BlankBase {
    private Boolean answer;
    private DraftRound draftRoundA1;
    private DraftRound draftRoundA2;
    private DraftRound draftRoundA3;
    private DraftRound draftRoundB1;
    private DraftRound draftRoundB2;
    private DraftRound draftRoundB3;
    private Game game;
    private Player playerA1;
    private Player playerA2;
    private Player playerA3;
    private Player playerB1;
    private Player playerB2;
    private Player playerB3;
    private Team teamA;
    private Team teamB;

    public Trade(Context context) {
        super(context);
    }

    public Trade(Trade trade) {
        super(trade.getContext());
        this.teamA = trade.getTeamA();
        this.playerA1 = trade.getPlayerA1();
        this.playerA2 = trade.getPlayerA2();
        this.playerA3 = trade.getPlayerA3();
        this.draftRoundA1 = trade.getDraftRoundA1();
        this.draftRoundA2 = trade.getDraftRoundA2();
        this.draftRoundA3 = trade.getDraftRoundA3();
    }

    public Boolean getAnswer() {
        return this.answer;
    }

    public void setAnswer(Boolean answer) {
        this.answer = answer;
    }

    public Team getTeamA() {
        if (this.teamA == null) {
            this.teamA = new Team(getContext());
        } else if (this.teamA.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.teamA);
        }
        return this.teamA;
    }

    public void setTeamA(Team teamA) {
        this.teamA = teamA;
    }

    public Team getTeamB() {
        if (this.teamB == null) {
            this.teamB = new Team(getContext());
        } else if (this.teamB.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.teamB);
        }
        return this.teamB;
    }

    public void setTeamB(Team teamB) {
        this.teamB = teamB;
    }

    public Player getPlayerA1() {
        if (this.playerA1 == null) {
            this.playerA1 = new Player(getContext());
        } else if (this.playerA1.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.playerA1);
        }
        return this.playerA1;
    }

    public void setPlayerA1(Player playerA1) {
        this.playerA1 = playerA1;
    }

    public Player getPlayerA2() {
        if (this.playerA2 == null) {
            this.playerA2 = new Player(getContext());
        } else if (this.playerA2.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.playerA2);
        }
        return this.playerA2;
    }

    public void setPlayerA2(Player playerA2) {
        this.playerA2 = playerA2;
    }

    public Player getPlayerA3() {
        if (this.playerA3 == null) {
            this.playerA3 = new Player(getContext());
        } else if (this.playerA3.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.playerA3);
        }
        return this.playerA3;
    }

    public void setPlayerA3(Player playerA3) {
        this.playerA3 = playerA3;
    }

    public DraftRound getDraftRoundA1() {
        if (this.draftRoundA1 == null) {
            this.draftRoundA1 = new DraftRound(getContext());
        } else if (this.draftRoundA1.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.draftRoundA1);
        }
        return this.draftRoundA1;
    }

    public void setDraftRoundA1(DraftRound draftRoundA1) {
        this.draftRoundA1 = draftRoundA1;
    }

    public DraftRound getDraftRoundA2() {
        if (this.draftRoundA2 == null) {
            this.draftRoundA2 = new DraftRound(getContext());
        } else if (this.draftRoundA2.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.draftRoundA2);
        }
        return this.draftRoundA2;
    }

    public void setDraftRoundA2(DraftRound draftRoundA2) {
        this.draftRoundA2 = draftRoundA2;
    }

    public DraftRound getDraftRoundA3() {
        if (this.draftRoundA3 == null) {
            this.draftRoundA3 = new DraftRound(getContext());
        } else if (this.draftRoundA3.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.draftRoundA3);
        }
        return this.draftRoundA3;
    }

    public void setDraftRoundA3(DraftRound draftRoundA3) {
        this.draftRoundA3 = draftRoundA3;
    }

    public Player getPlayerB1() {
        if (this.playerB1 == null) {
            this.playerB1 = new Player(getContext());
        } else if (this.playerB1.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.playerB1);
        }
        return this.playerB1;
    }

    public void setPlayerB1(Player playerB1) {
        this.playerB1 = playerB1;
    }

    public Player getPlayerB2() {
        if (this.playerB2 == null) {
            this.playerB2 = new Player(getContext());
        } else if (this.playerB2.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.playerB2);
        }
        return this.playerB2;
    }

    public void setPlayerB2(Player playerB2) {
        this.playerB2 = playerB2;
    }

    public Player getPlayerB3() {
        if (this.playerB3 == null) {
            this.playerB3 = new Player(getContext());
        } else if (this.playerB3.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.playerB3);
        }
        return this.playerB3;
    }

    public void setPlayerB3(Player playerB3) {
        this.playerB3 = playerB3;
    }

    public DraftRound getDraftRoundB1() {
        if (this.draftRoundB1 == null) {
            this.draftRoundB1 = new DraftRound(getContext());
        } else if (this.draftRoundB1.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.draftRoundB1);
        }
        return this.draftRoundB1;
    }

    public void setDraftRoundB1(DraftRound draftRoundB1) {
        this.draftRoundB1 = draftRoundB1;
    }

    public DraftRound getDraftRoundB2() {
        if (this.draftRoundB2 == null) {
            this.draftRoundB2 = new DraftRound(getContext());
        } else if (this.draftRoundB2.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.draftRoundB2);
        }
        return this.draftRoundB2;
    }

    public void setDraftRoundB2(DraftRound draftRoundB2) {
        this.draftRoundB2 = draftRoundB2;
    }

    public DraftRound getDraftRoundB3() {
        if (this.draftRoundB3 == null) {
            this.draftRoundB3 = new DraftRound(getContext());
        } else if (this.draftRoundB3.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.draftRoundB3);
        }
        return this.draftRoundB3;
    }

    public void setDraftRoundB3(DraftRound draftRoundB3) {
        this.draftRoundB3 = draftRoundB3;
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

    public int getNumPlayersOfPosition(int position) {
        int result = 0;
        if (getPlayerA1().getId() != null && (getPlayerA1().getPositionFirst().intValue() == position || getPlayerA1().getPositionSecond().intValue() == position)) {
            result = 0 + 1;
        }
        if (getPlayerA2().getId() != null && (getPlayerA2().getPositionFirst().intValue() == position || getPlayerA2().getPositionSecond().intValue() == position)) {
            result++;
        }
        if (getPlayerA3().getId() != null && (getPlayerA3().getPositionFirst().intValue() == position || getPlayerA3().getPositionSecond().intValue() == position)) {
            result++;
        }
        if (getPlayerB1().getId() != null && (getPlayerB1().getPositionFirst().intValue() == position || getPlayerB1().getPositionSecond().intValue() == position)) {
            result++;
        }
        if (getPlayerB2().getId() != null && (getPlayerB2().getPositionFirst().intValue() == position || getPlayerB2().getPositionSecond().intValue() == position)) {
            result++;
        }
        if (getPlayerB3().getId() == null) {
            return result;
        }
        if (getPlayerB3().getPositionFirst().intValue() == position || getPlayerB3().getPositionSecond().intValue() == position) {
            return result + 1;
        }
        return result;
    }
}
