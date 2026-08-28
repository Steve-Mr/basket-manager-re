package com.blank.bm15.model.object.other;

import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.Util;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class Rulete {
    private Match match;
    private int[] localTitulars = new int[10];
    private int[] localReserves = new int[10];
    private int[] visitorTitulars = new int[10];
    private int[] visitorReserves = new int[10];

    public Rulete(Match match) {
        this.match = match;
        loadValues(this.localTitulars, this.localReserves, 0, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 1, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 2, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 3, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 4, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 5, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 6, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 7, match.getTeamLocal());
        loadValues(this.localTitulars, this.localReserves, 8, match.getTeamLocal());
        loadValues(this.visitorTitulars, this.visitorReserves, 0, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 1, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 2, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 3, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 4, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 5, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 6, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 7, match.getTeamVisitor());
        loadValues(this.visitorTitulars, this.visitorReserves, 8, match.getTeamVisitor());
    }

    public Player getRulete(Integer ruleteSkill, Team team) {
        List<Player> list;
        int[] array;
        int benchImportance = 6 - team.getTactic().getTacticBenchImportance().intValue();
        if (Util.getRandomValue(0, Integer.valueOf(benchImportance)).intValue() < benchImportance) {
            list = team.getTactic().getPlayersTitulars();
            if (team.getId().equals(this.match.getTeamLocal().getId())) {
                array = this.localTitulars;
            } else {
                array = this.visitorTitulars;
            }
        } else {
            list = team.getTactic().getPlayersReserves();
            if (team.getId().equals(this.match.getTeamLocal().getId())) {
                array = this.localReserves;
            } else {
                array = this.visitorReserves;
            }
        }
        int random = Util.getRandomValue(1, Integer.valueOf(array[ruleteSkill.intValue()])).intValue();
        int total = 0;
        for (Player player : list) {
            total += getTotalRulete(player, ruleteSkill.intValue());
            if (total >= random) {
                return player;
            }
        }
        return null;
    }

    private int getTotalRulete(Player player, int ruleteSkill) {
        if (player.getStateInjury().intValue() > 0 || player.getCurrentMatchResult() == null || player.getCurrentMatchResult().getFoulsMade().doubleValue() >= 6.0d) {
            return 0;
        }
        int minutesPlayed = player.getCurrentMatchResult().getMinutesPlayed().intValue();
        int minutesPlayedForPoints = minutesPlayed;
        if (player.getIsStarOne().booleanValue()) {
            minutesPlayedForPoints += 9;
        }
        if (player.getIsStarTwo().booleanValue()) {
            minutesPlayedForPoints += 6;
        }
        if (player.getIsStarThree().booleanValue()) {
            minutesPlayedForPoints += 3;
        }
        if (ruleteSkill == 0) {
            return minutesPlayed;
        }
        if (ruleteSkill == 1) {
            int total = (player.getSkillPhysique().intValue() + player.getBaseMatchDefenseModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 1).intValue() * minutesPlayed;
            return total;
        }
        if (ruleteSkill == 2) {
            int total2 = (player.getSkillBlock().intValue() + player.getBaseMatchDefenseModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 2).intValue() * minutesPlayed;
            return total2;
        }
        if (ruleteSkill == 3) {
            int total3 = (player.getSkillSteal().intValue() + player.getBaseMatchDefenseModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 3).intValue() * minutesPlayed;
            return total3;
        }
        if (ruleteSkill == 4) {
            int total4 = (player.getSkillRebound().intValue() + player.getBaseMatchDefenseModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 4).intValue() * minutesPlayed;
            return total4;
        }
        if (ruleteSkill == 5) {
            int total5 = (player.getSkillPass().intValue() + player.getBaseMatchAttackModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 5).intValue() * minutesPlayed;
            return total5;
        }
        if (ruleteSkill == 6) {
            int total6 = (player.getSkillShotInterior().intValue() + player.getBaseMatchAttackModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 6).intValue() * minutesPlayedForPoints;
            return total6;
        }
        if (ruleteSkill == 7) {
            int total7 = (player.getSkillShotExterior().intValue() + player.getBaseMatchAttackModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 7).intValue() * minutesPlayedForPoints;
            return total7;
        }
        if (ruleteSkill != 8) {
            return 0;
        }
        int total8 = (player.getSkillShotFree().intValue() + player.getBaseMatchAttackModifier().intValue()) * Player.getBaseOfPosition(player.getPositionMatch().intValue(), 8).intValue() * minutesPlayedForPoints;
        return total8;
    }

    private void loadValues(int[] titulars, int[] reserves, int position, Team team) {
        int totalTitulars = 0;
        for (Player player : team.getTactic().getPlayersTitulars()) {
            totalTitulars += getTotalRulete(player, position);
        }
        titulars[position] = totalTitulars;
        int totalReserves = 0;
        for (Player player2 : team.getTactic().getPlayersReserves()) {
            totalReserves += getTotalRulete(player2, position);
        }
        reserves[position] = totalReserves;
    }
}
