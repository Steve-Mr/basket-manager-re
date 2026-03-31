package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.util.Util;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class Player extends BlankBase {
    private Integer age;
    private Game game;
    private Integer loyalty;
    private String name;
    private Integer positionFirst;
    private Integer positionSecond;
    private Integer potential;
    private Integer salary;
    private Integer skillBlock;
    private Integer skillPass;
    private Integer skillPhysique;
    private Integer skillRebound;
    private Integer skillShotExterior;
    private Integer skillShotFree;
    private Integer skillShotInterior;
    private Integer skillSteal;
    private Integer stateEnergy;
    private Integer stateForm;
    private Integer stateInjury;
    private Team team;
    private Integer tempBaseMatchAttackModifier;
    private Integer tempBaseMatchDefenseModifier;
    private MatchResult tempCurrentMatchResult;
    private Boolean tempIsReserve;
    private Boolean tempIsStarOne;
    private Boolean tempIsStarThree;
    private Boolean tempIsStarTwo;
    private Boolean tempIsTitular;
    private List<Offer> tempOfferList;
    private Integer tempPositionMatch;
    private Integer yearsContract;
    private Integer yearsExperience;

    public Player(Context context) {
        super(context);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPositionFirst() {
        return this.positionFirst;
    }

    public void setPositionFirst(Integer positionFirst) {
        this.positionFirst = positionFirst;
    }

    public Integer getPositionSecond() {
        if (this.positionSecond == null) {
            this.positionSecond = 0;
        }
        return this.positionSecond;
    }

    public void setPositionSecond(Integer positionSecond) {
        this.positionSecond = positionSecond;
    }

    public Integer getPotential() {
        return this.potential;
    }

    public void setPotential(Integer potential) {
        if (potential.intValue() < 1) {
            this.potential = 1;
        } else if (potential.intValue() > 10) {
            this.potential = 10;
        } else {
            this.potential = potential;
        }
    }

    public Integer getAge() {
        return this.age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSalary() {
        if (this.salary == null) {
            this.salary = 0;
        }
        return this.salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getYearsContract() {
        if (this.yearsContract == null) {
            this.yearsContract = 0;
        }
        return this.yearsContract;
    }

    public void setYearsContract(Integer yearsContract) {
        this.yearsContract = yearsContract;
    }

    public Integer getLoyalty() {
        return this.loyalty;
    }

    public void setLoyalty(Integer loyalty) {
        this.loyalty = loyalty;
    }

    public Integer getYearsExperience() {
        return this.yearsExperience;
    }

    public void setYearsExperience(Integer yearsExperience) {
        this.yearsExperience = yearsExperience;
    }

    public Integer getSkillBlock() {
        return this.skillBlock;
    }

    public void setSkillBlock(Integer skillBlock) {
        if (skillBlock.intValue() < 40) {
            this.skillBlock = 40;
        } else if (skillBlock.intValue() > 99) {
            this.skillBlock = 99;
        } else {
            this.skillBlock = skillBlock;
        }
    }

    public Integer getSkillPass() {
        return this.skillPass;
    }

    public void setSkillPass(Integer skillPass) {
        if (skillPass.intValue() < 40) {
            this.skillPass = 40;
        } else if (skillPass.intValue() > 99) {
            this.skillPass = 99;
        } else {
            this.skillPass = skillPass;
        }
    }

    public Integer getSkillPhysique() {
        return this.skillPhysique;
    }

    public void setSkillPhysique(Integer skillPhysique) {
        if (skillPhysique.intValue() < 40) {
            this.skillPhysique = 40;
        } else if (skillPhysique.intValue() > 99) {
            this.skillPhysique = 99;
        } else {
            this.skillPhysique = skillPhysique;
        }
    }

    public Integer getSkillRebound() {
        return this.skillRebound;
    }

    public void setSkillRebound(Integer skillRebound) {
        if (skillRebound.intValue() < 40) {
            this.skillRebound = 40;
        } else if (skillRebound.intValue() > 99) {
            this.skillRebound = 99;
        } else {
            this.skillRebound = skillRebound;
        }
    }

    public Integer getSkillSteal() {
        return this.skillSteal;
    }

    public void setSkillSteal(Integer skillSteal) {
        if (skillSteal.intValue() < 40) {
            this.skillSteal = 40;
        } else if (skillSteal.intValue() > 99) {
            this.skillSteal = 99;
        } else {
            this.skillSteal = skillSteal;
        }
    }

    public Integer getSkillShotInterior() {
        return this.skillShotInterior;
    }

    public void setSkillShotInterior(Integer skillShotInterior) {
        if (skillShotInterior.intValue() < 40) {
            this.skillShotInterior = 40;
        } else if (skillShotInterior.intValue() > 99) {
            this.skillShotInterior = 99;
        } else {
            this.skillShotInterior = skillShotInterior;
        }
    }

    public Integer getSkillShotExterior() {
        return this.skillShotExterior;
    }

    public void setSkillShotExterior(Integer skillShotExterior) {
        if (skillShotExterior.intValue() < 40) {
            this.skillShotExterior = 40;
        } else if (skillShotExterior.intValue() > 99) {
            this.skillShotExterior = 99;
        } else {
            this.skillShotExterior = skillShotExterior;
        }
    }

    public Integer getSkillShotFree() {
        return this.skillShotFree;
    }

    public void setSkillShotFree(Integer skillShotFree) {
        if (skillShotFree.intValue() < 40) {
            this.skillShotFree = 40;
        } else if (skillShotFree.intValue() > 99) {
            this.skillShotFree = 99;
        } else {
            this.skillShotFree = skillShotFree;
        }
    }

    public Integer getStateEnergy() {
        return this.stateEnergy;
    }

    public void setStateEnergy(Integer stateEnergy) {
        if (stateEnergy.intValue() > 99) {
            this.stateEnergy = 99;
        } else if (stateEnergy.intValue() < 20) {
            this.stateEnergy = 20;
        } else {
            this.stateEnergy = stateEnergy;
        }
    }

    public Integer getStateForm() {
        return this.stateForm;
    }

    public void setStateForm(Integer stateForm) {
        if (stateForm.intValue() > 99) {
            this.stateForm = 99;
        } else if (stateForm.intValue() < 20) {
            this.stateForm = 20;
        } else {
            this.stateForm = stateForm;
        }
    }

    public Integer getStateInjury() {
        if (this.stateInjury == null) {
            this.stateInjury = 0;
        }
        return this.stateInjury;
    }

    public void setStateInjury(Integer stateInjury) {
        this.stateInjury = stateInjury;
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

    public MatchResult getCurrentMatchResult() {
        return this.tempCurrentMatchResult;
    }

    public void setCurrentMatchResult(MatchResult currentMatchResult) {
        this.tempCurrentMatchResult = currentMatchResult;
    }

    public Integer getBaseMatchAttackModifier() {
        return this.tempBaseMatchAttackModifier;
    }

    public void setBaseMatchAttackModifier(Integer tempBaseMatchAttackModifier) {
        this.tempBaseMatchAttackModifier = tempBaseMatchAttackModifier;
    }

    public Integer getBaseMatchDefenseModifier() {
        return this.tempBaseMatchDefenseModifier;
    }

    public void setBaseMatchDefenseModifier(Integer tempBaseMatchDefenseModifier) {
        this.tempBaseMatchDefenseModifier = tempBaseMatchDefenseModifier;
    }

    public Integer getPositionMatch() {
        if (this.tempPositionMatch == null) {
            this.tempPositionMatch = 0;
        }
        return this.tempPositionMatch;
    }

    public void setPositionMatch(Integer tempPositionMatch) {
        this.tempPositionMatch = tempPositionMatch;
    }

    public Boolean getIsStarOne() {
        if (this.tempIsStarOne == null) {
            this.tempIsStarOne = Boolean.FALSE;
        }
        return this.tempIsStarOne;
    }

    public void setIsStarOne(Boolean tempIsStarOne) {
        this.tempIsStarOne = tempIsStarOne;
    }

    public Boolean getIsStarTwo() {
        if (this.tempIsStarTwo == null) {
            this.tempIsStarTwo = Boolean.FALSE;
        }
        return this.tempIsStarTwo;
    }

    public void setIsStarTwo(Boolean tempIsStarTwo) {
        this.tempIsStarTwo = tempIsStarTwo;
    }

    public Boolean getIsStarThree() {
        if (this.tempIsStarThree == null) {
            this.tempIsStarThree = Boolean.FALSE;
        }
        return this.tempIsStarThree;
    }

    public void setIsStarThree(Boolean tempIsStarThree) {
        this.tempIsStarThree = tempIsStarThree;
    }

    public Boolean getIsTitular() {
        if (this.tempIsTitular == null) {
            this.tempIsTitular = Boolean.FALSE;
        }
        return this.tempIsTitular;
    }

    public void setIsTitular(Boolean tempIsTitular) {
        this.tempIsTitular = tempIsTitular;
    }

    public Boolean getIsReserve() {
        if (this.tempIsReserve == null) {
            this.tempIsReserve = Boolean.FALSE;
        }
        return this.tempIsReserve;
    }

    public void setIsReserve(Boolean tempIsReserve) {
        this.tempIsReserve = tempIsReserve;
    }

    public List<Offer> getOfferList() {
        if (this.tempOfferList == null) {
            this.tempOfferList = new ArrayList();
        }
        return this.tempOfferList;
    }

    public void setOfferList(List<Offer> tempOfferList) {
        this.tempOfferList = tempOfferList;
    }

    public Boolean getIsBestInPosition(Boolean firstPosition) {
        int position = (firstPosition.booleanValue() ? getPositionFirst() : getPositionSecond()).intValue();
        for (Player player : getTeam().getTactic().getPlayers()) {
            if (player.getPositionFirst().intValue() == position || player.getPositionSecond().intValue() == position) {
                if (player.getId().intValue() != getId().intValue() && player.getValue().doubleValue() > getValue().doubleValue()) {
                    return Boolean.FALSE;
                }
            }
        }
        return Boolean.TRUE;
    }

    public Boolean getIsUniqueInPosition(Boolean firstPosition) {
        int position = (firstPosition.booleanValue() ? getPositionFirst() : getPositionSecond()).intValue();
        for (Player player : getTeam().getTactic().getPlayers()) {
            if (player.getPositionFirst().intValue() == position || player.getPositionSecond().intValue() == position) {
                if (player.getId().intValue() != getId().intValue()) {
                    return Boolean.FALSE;
                }
            }
        }
        return Boolean.TRUE;
    }

    public Boolean getIsInLineup() {
        return getIsTitular().booleanValue() || getIsReserve().booleanValue();
    }

    public String getShortName() {
        return Util.getPlayerShortName(getName());
    }

    public Double getValue() {
        return Double.valueOf((getAverageSkillAll().doubleValue() + (getPotential().intValue() * 2)) - (getAge().intValue() / 2));
    }

    public Double getMatchValue(Integer position) {
        return Double.valueOf(((getAverageSkillAll().doubleValue() + (getPotential().intValue() * 1.8d)) - (getAge().intValue() / Util.getRandomValue(2, 3).intValue())) + getPenalty(position).intValue());
    }

    public double getMarketValue() {
        double marketValue = ((((getValue().doubleValue() - 70.0d) * Math.abs(getValue().doubleValue() - 70.0d)) / 4.0d) - ((getSalary().intValue() / 2500000) + (((getAge().intValue() - 18) * (getAge().intValue() - 18)) / 15))) + 10.0d;
        if (getAge().intValue() < 24 && getPotential().intValue() > 8) {
            marketValue += getPotential().intValue();
        }
        if (getAverageSkillAll().doubleValue() > 79.0d) {
            marketValue += getPotential().intValue() + 10;
        }
        if (marketValue < 0.0d) {
            return marketValue / 4.0d;
        }
        return marketValue;
    }

    public Integer getPenalty(Integer position) {
        int playerModifier;
        int playerModifier2;
        int playerModifier3 = 0;
        if (position != null && position.intValue() != getPositionFirst().intValue()) {
            playerModifier3 = position.intValue() == getPositionSecond().intValue() ? -2 : -7;
        }
        if (getStateForm().intValue() >= 80) {
            playerModifier = playerModifier3 + 0;
        } else if (getStateForm().intValue() >= 60) {
            playerModifier = playerModifier3 - 1;
        } else if (getStateForm().intValue() >= 40) {
            playerModifier = playerModifier3 - 2;
        } else if (getStateForm().intValue() >= 20) {
            playerModifier = playerModifier3 - 4;
        } else {
            playerModifier = playerModifier3 - 8;
        }
        if (getStateEnergy().intValue() >= 80) {
            playerModifier2 = playerModifier + 0;
        } else if (getStateEnergy().intValue() >= 60) {
            playerModifier2 = playerModifier - 1;
        } else if (getStateEnergy().intValue() >= 40) {
            playerModifier2 = playerModifier - 2;
        } else if (getStateEnergy().intValue() >= 20) {
            playerModifier2 = playerModifier - 4;
        } else {
            playerModifier2 = playerModifier - 8;
        }
        return Integer.valueOf(playerModifier2);
    }

    public Double getAverageSkillAll() {
        return getAverageForPosition(getPositionFirst(), Boolean.TRUE.booleanValue(), Boolean.TRUE.booleanValue());
    }

    public Double getAverageSkillAttack() {
        return getAverageForPosition(getPositionFirst(), Boolean.TRUE.booleanValue(), Boolean.FALSE.booleanValue());
    }

    public Double getAverageSkillDefense() {
        return getAverageForPosition(getPositionFirst(), Boolean.FALSE.booleanValue(), Boolean.TRUE.booleanValue());
    }

    public Double getAverageSkillAllByPosition(Integer position) {
        return getAverageForPosition(position, Boolean.TRUE.booleanValue(), Boolean.TRUE.booleanValue());
    }

    private Double getAverageForPosition(Integer position, boolean attack, boolean defense) {
        Double average = Double.valueOf(0.0d);
        if (position != null && position.intValue() != 0) {
            if (attack) {
                average = Double.valueOf(average.doubleValue() + (((((getSkillPass().intValue() * getBaseOfPosition(position.intValue(), 5).intValue()) + (getSkillShotInterior().intValue() * getBaseOfPosition(position.intValue(), 6).intValue())) + (getSkillShotExterior().intValue() * getBaseOfPosition(position.intValue(), 7).intValue())) + (getSkillShotFree().intValue() * getBaseOfPosition(position.intValue(), 8).intValue())) / getAttackDivisor(position.intValue()).intValue()));
            }
            if (defense) {
                average = Double.valueOf(average.doubleValue() + (((((getSkillPhysique().intValue() * getBaseOfPosition(position.intValue(), 1).intValue()) + (getSkillBlock().intValue() * getBaseOfPosition(position.intValue(), 2).intValue())) + (getSkillSteal().intValue() * getBaseOfPosition(position.intValue(), 3).intValue())) + (getSkillRebound().intValue() * getBaseOfPosition(position.intValue(), 4).intValue())) / getDefenseDivisor(position.intValue()).intValue()));
            }
            average = (attack && defense) ? Double.valueOf((average.doubleValue() / 1.5d) - 19.0d) : Double.valueOf((average.doubleValue() / 0.75d) - 19.0d);
        }
        return average.doubleValue() > 99.0d ? Double.valueOf(99.0d) : average.doubleValue() < 40.0d ? Double.valueOf(40.0d) : average;
    }

    private Integer getAttackDivisor(int position) {
        return Integer.valueOf(getBaseOfPosition(position, 5).intValue() + getBaseOfPosition(position, 6).intValue() + getBaseOfPosition(position, 7).intValue() + getBaseOfPosition(position, 8).intValue());
    }

    private Integer getDefenseDivisor(int position) {
        return Integer.valueOf(getBaseOfPosition(position, 1).intValue() + getBaseOfPosition(position, 2).intValue() + getBaseOfPosition(position, 3).intValue() + getBaseOfPosition(position, 4).intValue());
    }

    public static Integer getBaseOfPosition(int position, int skill) {
        if (skill == 1) {
            if (1 != position && 2 != position) {
                if (3 == position) {
                    return 27;
                }
                if (4 == position || 5 == position) {
                    return 31;
                }
            }
            return 25;
        }
        if (skill == 2) {
            if (1 == position) {
                return 10;
            }
            if (2 == position) {
                return 15;
            }
            if (3 == position) {
                return 27;
            }
            if (4 == position || 5 == position) {
                return 31;
            }
        } else {
            if (skill == 3) {
                if (1 == position) {
                    return 30;
                }
                if (2 != position && 3 != position) {
                    if (4 == position) {
                        return 15;
                    }
                    if (5 == position) {
                        return 10;
                    }
                }
                return 27;
            }
            if (skill == 4) {
                if (1 != position && 2 != position) {
                    if (3 == position) {
                        return 27;
                    }
                    if (4 == position) {
                        return 31;
                    }
                    if (5 == position) {
                        return 35;
                    }
                }
                return 20;
            }
            if (skill == 5) {
                if (1 == position) {
                    return 35;
                }
                if (2 == position) {
                    return 30;
                }
                if (3 == position) {
                    return 27;
                }
                if (4 == position || 5 == position) {
                    return 18;
                }
            } else if (skill == 6) {
                if (1 == position) {
                    return 15;
                }
                if (2 == position) {
                    return 25;
                }
                if (3 == position) {
                    return 28;
                }
                if (4 == position) {
                    return 33;
                }
                if (5 == position) {
                    return 35;
                }
            } else if (skill == 7) {
                if (1 == position) {
                    return 30;
                }
                if (2 == position) {
                    return 35;
                }
                if (3 == position) {
                    return 28;
                }
                if (4 == position) {
                    return 25;
                }
                if (5 == position) {
                    return 15;
                }
            } else if (skill == 8) {
                if (1 != position && 2 != position) {
                    if (3 == position) {
                        return 28;
                    }
                    if (4 == position || 5 == position) {
                        return 20;
                    }
                }
                return 30;
            }
        }
        return null;
    }
}
