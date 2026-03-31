package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.util.Constant;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class Team extends BlankBase {
    private Integer color;
    private Integer conference;
    private Integer division;
    private String fullName;
    private Game game;
    private String name;
    private Integer salaryCap;
    private DraftRound tempDraftRound1;
    private DraftRound tempDraftRound2;
    private League tempLeague;
    private Playoffs tempPlayoffs;
    private Tactic tempTactic;

    public Team(Context context) {
        super(context);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullName() {
        if (this.fullName == null) {
            this.fullName = this.name;
        }
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Integer getConference() {
        return this.conference;
    }

    public void setConference(Integer conference) {
        this.conference = conference;
    }

    public Integer getDivision() {
        return this.division;
    }

    public void setDivision(Integer division) {
        this.division = division;
    }

    public Integer getSalaryCap() {
        return this.salaryCap;
    }

    public void setSalaryCap(Integer salaryCap) {
        if (salaryCap.intValue() < Constant.SALARY_CAP_MIN.intValue()) {
            this.salaryCap = Constant.SALARY_CAP_MIN;
        } else if (salaryCap.intValue() > Constant.SALARY_CAP_MAX.intValue()) {
            this.salaryCap = Constant.SALARY_CAP_MAX;
        } else {
            this.salaryCap = salaryCap;
        }
    }

    public Integer getColor() {
        return this.color;
    }

    public void setColor(Integer color) {
        this.color = color;
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

    public Tactic getTactic() {
        if (this.tempTactic == null) {
            this.tempTactic = new Tactic(getContext());
            this.tempTactic.setGame(getGame());
            this.tempTactic.setTeam(this);
            BlankDao.get(this.tempTactic);
        }
        return this.tempTactic;
    }

    public League getLeague() {
        if (this.tempLeague == null) {
            this.tempLeague = new League(getContext());
            this.tempLeague.setGame(getGame());
            this.tempLeague.setTeam(this);
            BlankDao.get(this.tempLeague);
        }
        return this.tempLeague;
    }

    public DraftRound getDraftRound1() {
        if (this.tempDraftRound1 == null) {
            this.tempDraftRound1 = new DraftRound(getContext());
            this.tempDraftRound1.setGame(getGame());
            this.tempDraftRound1.setTeamOwner(this);
            this.tempDraftRound1.setRound(1);
            BlankDao.get(this.tempDraftRound1);
        }
        return this.tempDraftRound1;
    }

    public DraftRound getDraftRound2() {
        if (this.tempDraftRound2 == null) {
            this.tempDraftRound2 = new DraftRound(getContext());
            this.tempDraftRound2.setGame(getGame());
            this.tempDraftRound2.setTeamOwner(this);
            this.tempDraftRound2.setRound(2);
            BlankDao.get(this.tempDraftRound2);
        }
        return this.tempDraftRound2;
    }

    public Playoffs getPlayoffs() {
        if (this.tempPlayoffs == null) {
            this.tempPlayoffs = new Playoffs(getContext());
            this.tempPlayoffs.setGame(getGame());
            this.tempPlayoffs.setTeam(this);
            BlankDao.get(this.tempPlayoffs);
        }
        return this.tempPlayoffs;
    }

    public String getShortFullName() {
        String shortFullName = getFullName().replaceAll("\\s", "").toUpperCase();
        return shortFullName.substring(0, 3);
    }

    public Boolean getMoreInjuries() {
        int playersOk = 0;
        for (Player player : getTactic().getPlayers()) {
            if (player.getStateInjury().intValue() == 0) {
                playersOk++;
            }
        }
        return 12 < playersOk;
    }

    public void addSalaryCap(Integer amount) {
        setSalaryCap(Integer.valueOf(getSalaryCap().intValue() + amount.intValue()));
    }

    public Integer getTeamSalary(Player renewPlayer) {
        int salary = 0;
        for (Player player : getTactic().getPlayers()) {
            if (renewPlayer == null || renewPlayer.getId().intValue() != player.getId().intValue()) {
                salary += player.getSalary().intValue();
            }
        }
        return Integer.valueOf(salary);
    }

    public int getNumPlayersOfPosition(int position) {
        int num = 0;
        for (Player player : getTactic().getPlayers()) {
            if (player.getPositionFirst().intValue() == position) {
                num++;
            } else if (player.getPositionSecond() != null && player.getPositionSecond().intValue() == position) {
                num++;
            }
        }
        return num;
    }

    public double getTeamAverageValueOfThreeBestPlayersByPosition(int position) {
        double average = 0.0d;
        int i = 0;
        Collections.sort(getTactic().getPlayers(), new PlayerComparator(0, -1));
        for (Player player : getTactic().getPlayers()) {
            if (player.getPositionFirst().intValue() == position || player.getPositionSecond().intValue() == position) {
                average += player.getValue().doubleValue();
                i++;
            }
            if (i == 3) {
                break;
            }
        }
        return average / 3.0d;
    }

    public Double getTeamAverageValue() {
        double d;
        double average = 0.0d;
        double divisor = 0.0d;
        int i = 0;
        Collections.sort(getTactic().getPlayers(), new PlayerComparator(0, -1));
        for (Player player : getTactic().getPlayers()) {
            if (i < 3) {
                average += player.getValue().doubleValue() * 10.0d;
                d = 10.0d;
            } else if (i < 6) {
                average += player.getValue().doubleValue() * 5.0d;
                d = 5.0d;
            } else if (i < 10) {
                average += player.getValue().doubleValue() * 2.0d;
                d = 2.0d;
            } else {
                average += player.getValue().doubleValue() * 0.0d;
                d = 0.0d;
            }
            divisor += d;
            i++;
        }
        if (i == 0) {
            return Double.valueOf(0.0d);
        }
        return Double.valueOf(average / divisor);
    }

    public Double getTeamAverageAge() {
        double average = 0.0d;
        double divisor = 0.0d;
        int i = 0;
        Collections.sort(getTactic().getPlayers(), new PlayerComparator(0, -1));
        for (Player player : getTactic().getPlayers()) {
            if (i < 3) {
                average += player.getAge().intValue() * 10;
                divisor += 10.0d;
            } else if (i < 6) {
                average += player.getAge().intValue() * 5;
                divisor += 5.0d;
            } else if (i < 10) {
                average += player.getAge().intValue() * 2;
                divisor += 2.0d;
            } else {
                average += player.getAge().intValue() * 0;
                divisor += 0.0d;
            }
            i++;
        }
        if (i == 0) {
            return Double.valueOf(0.0d);
        }
        return Double.valueOf(average / divisor);
    }

    public Double getTeamAveragePotential() {
        double average = 0.0d;
        double divisor = 0.0d;
        int i = 0;
        Collections.sort(getTactic().getPlayers(), new PlayerComparator(0, -1));
        for (Player player : getTactic().getPlayers()) {
            if (i < 3) {
                average += player.getPotential().intValue() * 10;
                divisor += 10.0d;
            } else if (i < 6) {
                average += player.getPotential().intValue() * 5;
                divisor += 5.0d;
            } else if (i < 10) {
                average += player.getPotential().intValue() * 2;
                divisor += 2.0d;
            }
            i++;
        }
        if (i == 0) {
            return Double.valueOf(0.0d);
        }
        return Double.valueOf(4.0d * ((average / divisor) - 6.0d));
    }

    public Double getTeamAverageSkillAll() {
        return Double.valueOf((getTeamAverageSkillAttack().doubleValue() + getTeamAverageSkillDefense().doubleValue()) / 2.0d);
    }

    public Double getTeamAverageSkillAttack() {
        double d;
        double average = 0.0d;
        double divisor = 0.0d;
        int i = 0;
        Collections.sort(getTactic().getPlayers(), new PlayerComparator(0, -1));
        for (Player player : getTactic().getPlayers()) {
            if (i < 3) {
                average += player.getAverageSkillAttack().doubleValue() * 10.0d;
                d = 10.0d;
            } else if (i < 6) {
                average += player.getAverageSkillAttack().doubleValue() * 5.0d;
                d = 5.0d;
            } else if (i < 10) {
                average += player.getAverageSkillAttack().doubleValue() * 2.0d;
                d = 2.0d;
            } else {
                average += player.getAverageSkillAttack().doubleValue() * 0.0d;
                d = 0.0d;
            }
            divisor += d;
            i++;
        }
        if (i == 0) {
            return Double.valueOf(0.0d);
        }
        return Double.valueOf(average / divisor);
    }

    public Double getTeamAverageSkillDefense() {
        double d;
        double average = 0.0d;
        double divisor = 0.0d;
        int i = 0;
        Collections.sort(getTactic().getPlayers(), new PlayerComparator(0, -1));
        for (Player player : getTactic().getPlayers()) {
            if (i < 3) {
                average += player.getAverageSkillDefense().doubleValue() * 10.0d;
                d = 10.0d;
            } else if (i < 6) {
                average += player.getAverageSkillDefense().doubleValue() * 5.0d;
                d = 5.0d;
            } else if (i < 10) {
                average += player.getAverageSkillDefense().doubleValue() * 2.0d;
                d = 2.0d;
            } else {
                average += player.getAverageSkillDefense().doubleValue() * 0.0d;
                d = 0.0d;
            }
            divisor += d;
            i++;
        }
        if (i == 0) {
            return Double.valueOf(0.0d);
        }
        return Double.valueOf(average / divisor);
    }

    public Double getPlayersAverageTitulars() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersTitulars(), null);
    }

    public Double getPlayersAverageTitularsAttack() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersTitulars(), Boolean.TRUE);
    }

    public Double getPlayersAverageTitularsDefense() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersTitulars(), Boolean.FALSE);
    }

    public Double getPlayersAverageReserves() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersReserves(), null);
    }

    public Double getPlayersAverageReservesAttack() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersReserves(), Boolean.TRUE);
    }

    public Double getPlayersAverageReservesDefense() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersReserves(), Boolean.FALSE);
    }

    public Double getPlayersAverageRemains() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersRemains(), null);
    }

    public Double getPlayersAverageRemainsAttack() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersRemains(), Boolean.TRUE);
    }

    public Double getPlayersAverageRemainsDefense() {
        return getPlayersAverageSkillsAll(getTactic().getPlayersRemains(), Boolean.FALSE);
    }

    private Double getPlayersAverageSkillsAll(List<Player> players, Boolean isAttack) {
        double doubleValue;
        double average = 0.0d;
        int i = 0;
        Collections.sort(players, new PlayerComparator(0, -1));
        for (Player player : players) {
            if (isAttack == null) {
                doubleValue = player.getAverageSkillAll().doubleValue();
            } else if (isAttack.booleanValue()) {
                doubleValue = player.getAverageSkillAttack().doubleValue();
            } else {
                doubleValue = player.getAverageSkillDefense().doubleValue();
            }
            average += doubleValue;
            i++;
        }
        if (i == 0) {
            return Double.valueOf(0.0d);
        }
        return Double.valueOf(average / i);
    }
}
