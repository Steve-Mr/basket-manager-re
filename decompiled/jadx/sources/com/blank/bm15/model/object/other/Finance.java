package com.blank.bm15.model.object.other;

import com.blank.bm15.model.object.crud.Player;

/* JADX INFO: loaded from: classes.dex */
public class Finance {
    private Player player;
    private Integer year1;
    private Integer year2;
    private Integer year3;
    private Integer year4;
    private Integer year5;

    public Finance(Player player) {
        this.player = player;
        if (player.getYearsContract().intValue() > 0) {
            this.year1 = player.getSalary();
        } else {
            this.year1 = 0;
        }
        if (player.getYearsContract().intValue() > 1) {
            this.year2 = player.getSalary();
        } else {
            this.year2 = 0;
        }
        if (player.getYearsContract().intValue() > 2) {
            this.year3 = player.getSalary();
        } else {
            this.year3 = 0;
        }
        if (player.getYearsContract().intValue() > 3) {
            this.year4 = player.getSalary();
        } else {
            this.year4 = 0;
        }
        if (player.getYearsContract().intValue() > 4) {
            this.year5 = player.getSalary();
        } else {
            this.year5 = 0;
        }
    }

    public Integer getYear1() {
        return this.year1;
    }

    public void setYear1(Integer year1) {
        this.year1 = year1;
    }

    public Integer getYear2() {
        return this.year2;
    }

    public void setYear2(Integer year2) {
        this.year2 = year2;
    }

    public Integer getYear3() {
        return this.year3;
    }

    public void setYear3(Integer year3) {
        this.year3 = year3;
    }

    public Integer getYear4() {
        return this.year4;
    }

    public void setYear4(Integer year4) {
        this.year4 = year4;
    }

    public Integer getYear5() {
        return this.year5;
    }

    public void setYear5(Integer year5) {
        this.year5 = year5;
    }

    public Player getPlayer() {
        return this.player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public void addPlayer(Player player) {
        this.player = null;
        this.year1 = Integer.valueOf(this.year1.intValue() + player.getSalary().intValue());
        if (player.getYearsContract().intValue() > 1) {
            this.year2 = Integer.valueOf(this.year2.intValue() + player.getSalary().intValue());
        }
        if (player.getYearsContract().intValue() > 2) {
            this.year3 = Integer.valueOf(this.year3.intValue() + player.getSalary().intValue());
        }
        if (player.getYearsContract().intValue() > 3) {
            this.year4 = Integer.valueOf(this.year4.intValue() + player.getSalary().intValue());
        }
        if (player.getYearsContract().intValue() > 4) {
            this.year5 = Integer.valueOf(this.year5.intValue() + player.getSalary().intValue());
        }
    }
}
