package com.blank.bm15.model.object.other;

import android.content.Context;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.object.crud.Player;

/* loaded from: classes.dex */
public class Roster extends BlankBase {
    private Integer age;
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
    private String team;
    private Integer yearsContract;
    private Integer yearsExperience;

    public Roster(Context context) {
        super(context);
    }

    public void loadPlayer(Player player) {
        if (player.getTeam().getName() == null) {
            this.team = "0";
        } else {
            this.team = player.getTeam().getName();
        }
        this.name = player.getName();
        this.positionFirst = player.getPositionFirst();
        this.positionSecond = player.getPositionSecond();
        this.potential = player.getPotential();
        this.age = player.getAge();
        this.salary = player.getSalary();
        this.yearsContract = player.getYearsContract();
        this.yearsExperience = player.getYearsExperience();
        this.skillBlock = player.getSkillBlock();
        this.skillPass = player.getSkillPass();
        this.skillPhysique = player.getSkillPhysique();
        this.skillRebound = player.getSkillRebound();
        this.skillSteal = player.getSkillSteal();
        this.skillShotInterior = player.getSkillShotInterior();
        this.skillShotExterior = player.getSkillShotExterior();
        this.skillShotFree = player.getSkillShotFree();
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeam() {
        return this.team;
    }

    public void setTeam(String team) {
        this.team = team;
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
        this.potential = potential;
    }

    public Integer getAge() {
        return this.age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSalary() {
        return this.salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getYearsContract() {
        return this.yearsContract;
    }

    public void setYearsContract(Integer yearsContract) {
        this.yearsContract = yearsContract;
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
        this.skillBlock = skillBlock;
    }

    public Integer getSkillPass() {
        return this.skillPass;
    }

    public void setSkillPass(Integer skillPass) {
        this.skillPass = skillPass;
    }

    public Integer getSkillPhysique() {
        return this.skillPhysique;
    }

    public void setSkillPhysique(Integer skillPhysique) {
        this.skillPhysique = skillPhysique;
    }

    public Integer getSkillRebound() {
        return this.skillRebound;
    }

    public void setSkillRebound(Integer skillRebound) {
        this.skillRebound = skillRebound;
    }

    public Integer getSkillSteal() {
        return this.skillSteal;
    }

    public void setSkillSteal(Integer skillSteal) {
        this.skillSteal = skillSteal;
    }

    public Integer getSkillShotInterior() {
        return this.skillShotInterior;
    }

    public void setSkillShotInterior(Integer skillShotInterior) {
        this.skillShotInterior = skillShotInterior;
    }

    public Integer getSkillShotExterior() {
        return this.skillShotExterior;
    }

    public void setSkillShotExterior(Integer skillShotExterior) {
        this.skillShotExterior = skillShotExterior;
    }

    public Integer getSkillShotFree() {
        return this.skillShotFree;
    }

    public void setSkillShotFree(Integer skillShotFree) {
        this.skillShotFree = skillShotFree;
    }
}
