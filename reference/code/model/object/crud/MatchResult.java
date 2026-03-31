package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.util.Util;

/* loaded from: classes.dex */
public class MatchResult extends BlankBase {
    private Double blocks;
    private Double foulsMade;
    private Game game;
    private Match match;
    private Integer matchday;
    private Integer minutesPlayed;
    private String name;
    private Double passesKo;
    private Double passesOk;
    private Player player;
    private Double rebounds;
    private Double shotsExteriorDoubleKo;
    private Double shotsExteriorDoubleOk;
    private Double shotsExteriorTripleKo;
    private Double shotsExteriorTripleOk;
    private Double shotsFreeKo;
    private Double shotsFreeOk;
    private Double shotsInteriorKo;
    private Double shotsInteriorOk;
    private Double steals;
    private Integer tempMatches;

    public MatchResult(Context context) {
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

    public Integer getMinutesPlayed() {
        if (this.minutesPlayed == null) {
            this.minutesPlayed = 0;
        }
        return this.minutesPlayed;
    }

    public void setMinutesPlayed(Integer minutesPlayed) {
        this.minutesPlayed = minutesPlayed;
    }

    public Double getBlocks() {
        if (this.blocks == null) {
            this.blocks = Double.valueOf(0.0d);
        }
        return this.blocks;
    }

    public void setBlocks(Double blocks) {
        this.blocks = Double.valueOf(Util.round(blocks.doubleValue()));
    }

    public Double getFoulsMade() {
        if (this.foulsMade == null) {
            this.foulsMade = Double.valueOf(0.0d);
        }
        return this.foulsMade;
    }

    public void setFoulsMade(Double foulsMade) {
        this.foulsMade = Double.valueOf(Util.round(foulsMade.doubleValue()));
    }

    public Double getPassesOk() {
        if (this.passesOk == null) {
            this.passesOk = Double.valueOf(0.0d);
        }
        return this.passesOk;
    }

    public void setPassesOk(Double passesOk) {
        this.passesOk = Double.valueOf(Util.round(passesOk.doubleValue()));
    }

    public Double getPassesKo() {
        if (this.passesKo == null) {
            this.passesKo = Double.valueOf(0.0d);
        }
        return this.passesKo;
    }

    public void setPassesKo(Double passesKo) {
        this.passesKo = Double.valueOf(Util.round(passesKo.doubleValue()));
    }

    public Double getRebounds() {
        if (this.rebounds == null) {
            this.rebounds = Double.valueOf(0.0d);
        }
        return this.rebounds;
    }

    public void setRebounds(Double rebounds) {
        this.rebounds = Double.valueOf(Util.round(rebounds.doubleValue()));
    }

    public Double getSteals() {
        if (this.steals == null) {
            this.steals = Double.valueOf(0.0d);
        }
        return this.steals;
    }

    public void setSteals(Double steals) {
        this.steals = Double.valueOf(Util.round(steals.doubleValue()));
    }

    public Double getShotsFreeOk() {
        if (this.shotsFreeOk == null) {
            this.shotsFreeOk = Double.valueOf(0.0d);
        }
        return this.shotsFreeOk;
    }

    public void setShotsFreeOk(Double shotsFreeOk) {
        this.shotsFreeOk = Double.valueOf(Util.round(shotsFreeOk.doubleValue()));
    }

    public Double getShotsFreeKo() {
        if (this.shotsFreeKo == null) {
            this.shotsFreeKo = Double.valueOf(0.0d);
        }
        return this.shotsFreeKo;
    }

    public void setShotsFreeKo(Double shotsFreeKo) {
        this.shotsFreeKo = Double.valueOf(Util.round(shotsFreeKo.doubleValue()));
    }

    public Double getShotsInteriorOk() {
        if (this.shotsInteriorOk == null) {
            this.shotsInteriorOk = Double.valueOf(0.0d);
        }
        return this.shotsInteriorOk;
    }

    public void setShotsInteriorOk(Double shotsInteriorOk) {
        this.shotsInteriorOk = Double.valueOf(Util.round(shotsInteriorOk.doubleValue()));
    }

    public Double getShotsInteriorKo() {
        if (this.shotsInteriorKo == null) {
            this.shotsInteriorKo = Double.valueOf(0.0d);
        }
        return this.shotsInteriorKo;
    }

    public void setShotsInteriorKo(Double shotsInteriorKo) {
        this.shotsInteriorKo = Double.valueOf(Util.round(shotsInteriorKo.doubleValue()));
    }

    public Double getShotsExteriorDoubleOk() {
        if (this.shotsExteriorDoubleOk == null) {
            this.shotsExteriorDoubleOk = Double.valueOf(0.0d);
        }
        return this.shotsExteriorDoubleOk;
    }

    public void setShotsExteriorDoubleOk(Double shotsExteriorDoubleOk) {
        this.shotsExteriorDoubleOk = Double.valueOf(Util.round(shotsExteriorDoubleOk.doubleValue()));
    }

    public Double getShotsExteriorDoubleKo() {
        if (this.shotsExteriorDoubleKo == null) {
            this.shotsExteriorDoubleKo = Double.valueOf(0.0d);
        }
        return this.shotsExteriorDoubleKo;
    }

    public void setShotsExteriorDoubleKo(Double shotsExteriorDoubleKo) {
        this.shotsExteriorDoubleKo = Double.valueOf(Util.round(shotsExteriorDoubleKo.doubleValue()));
    }

    public Double getShotsExteriorTripleOk() {
        if (this.shotsExteriorTripleOk == null) {
            this.shotsExteriorTripleOk = Double.valueOf(0.0d);
        }
        return this.shotsExteriorTripleOk;
    }

    public void setShotsExteriorTripleOk(Double shotsExteriorTripleOk) {
        this.shotsExteriorTripleOk = Double.valueOf(Util.round(shotsExteriorTripleOk.doubleValue()));
    }

    public Double getShotsExteriorTripleKo() {
        if (this.shotsExteriorTripleKo == null) {
            this.shotsExteriorTripleKo = Double.valueOf(0.0d);
        }
        return this.shotsExteriorTripleKo;
    }

    public void setShotsExteriorTripleKo(Double shotsExteriorTripleKo) {
        this.shotsExteriorTripleKo = Double.valueOf(Util.round(shotsExteriorTripleKo.doubleValue()));
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

    public Match getMatch() {
        if (this.match == null) {
            this.match = new Match(getContext());
        } else if (this.match.isNotLoaded().booleanValue()) {
            BlankDao.loadById(this.match);
        }
        return this.match;
    }

    public void setMatch(Match match) {
        this.match = match;
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

    public Integer getMatches() {
        if (this.tempMatches == null) {
            this.tempMatches = 1;
        }
        return this.tempMatches;
    }

    public void setMatches(Integer matches) {
        this.tempMatches = matches;
    }

    public void addMatchResult(MatchResult other) {
        setBlocks(Double.valueOf(getBlocksInt().intValue() + other.getBlocksInt().intValue()));
        setFoulsMade(Double.valueOf(getFoulsMadeInt().intValue() + other.getFoulsMadeInt().intValue()));
        setMinutesPlayed(Integer.valueOf(getMinutesPlayed().intValue() + other.getMinutesPlayed().intValue()));
        setPassesKo(Double.valueOf(getPassesKoInt().intValue() + other.getPassesKoInt().intValue()));
        setPassesOk(Double.valueOf(getPassesOkInt().intValue() + other.getPassesOkInt().intValue()));
        setRebounds(Double.valueOf(getReboundsInt().intValue() + other.getReboundsInt().intValue()));
        setShotsExteriorDoubleKo(Double.valueOf(getShotsExteriorDoubleKoInt().intValue() + other.getShotsExteriorDoubleKoInt().intValue()));
        setShotsExteriorDoubleOk(Double.valueOf(getShotsExteriorDoubleOkInt().intValue() + other.getShotsExteriorDoubleOkInt().intValue()));
        setShotsExteriorTripleKo(Double.valueOf(getShotsExteriorTripleKoInt().intValue() + other.getShotsExteriorTripleKoInt().intValue()));
        setShotsExteriorTripleOk(Double.valueOf(getShotsExteriorTripleOkInt().intValue() + other.getShotsExteriorTripleOkInt().intValue()));
        setShotsFreeKo(Double.valueOf(getShotsFreeKoInt().intValue() + other.getShotsFreeKoInt().intValue()));
        setShotsFreeOk(Double.valueOf(getShotsFreeOkInt().intValue() + other.getShotsFreeOkInt().intValue()));
        setShotsInteriorKo(Double.valueOf(getShotsInteriorKoInt().intValue() + other.getShotsInteriorKoInt().intValue()));
        setShotsInteriorOk(Double.valueOf(getShotsInteriorOkInt().intValue() + other.getShotsInteriorOkInt().intValue()));
        setSteals(Double.valueOf(getStealsInt().intValue() + other.getStealsInt().intValue()));
        setMatches(Integer.valueOf(getMatches().intValue() + 1));
    }

    public Integer getPoints() {
        double points = 0.0d + (getShotsFreeOkInt().intValue() * 1);
        return BlankObj.toInteger(Double.valueOf(points + (getShotsInteriorOkInt().intValue() * 2) + (getShotsExteriorDoubleOkInt().intValue() * 2) + (getShotsExteriorTripleOkInt().intValue() * 3)));
    }

    public Double getPer() {
        double per = getMinutesPlayed().intValue() > 0 ? ((((((((((((getStealsInt().intValue() * 54) + (getShotsExteriorTripleOkInt().intValue() * 52)) + ((getShotsInteriorOkInt().intValue() + getShotsExteriorDoubleOkInt().intValue()) * 85)) + (getShotsFreeOkInt().intValue() * 47)) + (getBlocksInt().intValue() * 39)) + (getPassesOkInt().intValue() * 35)) + (getReboundsInt().intValue() * 27)) - (getFoulsMadeInt().intValue() * 17)) - (getShotsFreeKoInt().intValue() * 20)) - ((getShotsInteriorKoInt().intValue() + getShotsExteriorDoubleKoInt().intValue()) * 39)) - (getShotsExteriorTripleKoInt().intValue() * 39)) - (getPassesKoInt().intValue() * 54)) / getMinutesPlayed().intValue() : -100.0d;
        return Double.valueOf(Util.round(per, 2));
    }

    public void addFoulMade() {
        setFoulsMade(Util.getRandomSimulate(getFoulsMade()));
    }

    public void addBlock() {
        setBlocks(Util.getRandomSimulate(getBlocks()));
    }

    public void addSteal() {
        setSteals(Util.getRandomSimulate(getSteals()));
    }

    public void addRebound() {
        setRebounds(Util.getRandomSimulate(getRebounds()));
    }

    public void addPassOK() {
        setPassesOk(Util.getRandomSimulate(getPassesOk()));
    }

    public void addPassKO() {
        setPassesKo(Util.getRandomSimulate(getPassesKo()));
    }

    public void addShotsFreeOk() {
        setShotsFreeOk(Util.getRandomSimulate(getShotsFreeOk()));
    }

    public void addShotsFreeKo() {
        setShotsFreeKo(Util.getRandomSimulate(getShotsFreeKo()));
    }

    public void addShotsInteriorOk() {
        setShotsInteriorOk(Util.getRandomSimulate(getShotsInteriorOk()));
    }

    public void addShotsInteriorKo() {
        setShotsInteriorKo(Util.getRandomSimulate(getShotsInteriorKo()));
    }

    public void addShotExteriorDoubleOk() {
        setShotsExteriorDoubleOk(Util.getRandomSimulate(getShotsExteriorDoubleOk()));
    }

    public void addShotExteriorDoubleKo() {
        setShotsExteriorDoubleKo(Util.getRandomSimulate(getShotsExteriorDoubleKo()));
    }

    public void addShotExteriorTripleOk() {
        setShotsExteriorTripleOk(Util.getRandomSimulate(getShotsExteriorTripleOk()));
    }

    public void addShotExteriorTripleKo() {
        setShotsExteriorTripleKo(Util.getRandomSimulate(getShotsExteriorTripleKo()));
    }

    public Integer getBlocksInt() {
        return BlankObj.toInteger(getBlocks());
    }

    public Integer getFoulsMadeInt() {
        return BlankObj.toInteger(getFoulsMade());
    }

    public Integer getPassesOkInt() {
        return BlankObj.toInteger(getPassesOk());
    }

    public Integer getPassesKoInt() {
        return BlankObj.toInteger(getPassesKo());
    }

    public Integer getReboundsInt() {
        return BlankObj.toInteger(getRebounds());
    }

    public Integer getStealsInt() {
        return BlankObj.toInteger(getSteals());
    }

    public Integer getShotsFreeOkInt() {
        return BlankObj.toInteger(getShotsFreeOk());
    }

    public Integer getShotsFreeKoInt() {
        return BlankObj.toInteger(getShotsFreeKo());
    }

    public Integer getShotsInteriorOkInt() {
        return BlankObj.toInteger(getShotsInteriorOk());
    }

    public Integer getShotsInteriorKoInt() {
        return BlankObj.toInteger(getShotsInteriorKo());
    }

    public Integer getShotsExteriorDoubleOkInt() {
        return BlankObj.toInteger(getShotsExteriorDoubleOk());
    }

    public Integer getShotsExteriorDoubleKoInt() {
        return BlankObj.toInteger(getShotsExteriorDoubleKo());
    }

    public Integer getShotsExteriorTripleOkInt() {
        return BlankObj.toInteger(getShotsExteriorTripleOk());
    }

    public Integer getShotsExteriorTripleKoInt() {
        return BlankObj.toInteger(getShotsExteriorTripleKo());
    }

    public Integer getShotOnePointOK() {
        return getShotsFreeOkInt();
    }

    public Integer getShotOnePointKO() {
        return getShotsFreeKoInt();
    }

    public Integer getShotOnePointTotals() {
        return Integer.valueOf(getShotOnePointOK().intValue() + getShotOnePointKO().intValue());
    }

    public Integer getShotTwoPointsOK() {
        return Integer.valueOf(getShotsInteriorOkInt().intValue() + getShotsExteriorDoubleOkInt().intValue());
    }

    public Integer getShotTwoPointsKO() {
        return Integer.valueOf(getShotsInteriorKoInt().intValue() + getShotsExteriorDoubleKoInt().intValue());
    }

    public Integer getShotTwoPointsTotals() {
        return Integer.valueOf(getShotTwoPointsOK().intValue() + getShotTwoPointsKO().intValue());
    }

    public Integer getShotThreePointsOK() {
        return getShotsExteriorTripleOkInt();
    }

    public Integer getShotThreePointsKO() {
        return getShotsExteriorTripleKoInt();
    }

    public Integer getShotThreePointsTotals() {
        return Integer.valueOf(getShotThreePointsOK().intValue() + getShotThreePointsKO().intValue());
    }
}
