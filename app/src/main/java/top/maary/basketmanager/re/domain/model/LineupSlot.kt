package top.maary.basketmanager.re.domain.model

enum class LineupSlot(val title: String, val position: Position, val isStarter: Boolean) {
    STARTER_PG("Point Guard", Position.PG, true),
    STARTER_SG("Shooting Guard", Position.SG, true),
    STARTER_SF("Small Forward", Position.SF, true),
    STARTER_PF("Power Forward", Position.PF, true),
    STARTER_C("Center", Position.C, true),
    RESERVE_PG("Backup PG", Position.PG, false),
    RESERVE_SG("Backup SG", Position.SG, false),
    RESERVE_SF("Backup SF", Position.SF, false),
    RESERVE_PF("Backup PF", Position.PF, false),
    RESERVE_C("Backup C", Position.C, false)
}
