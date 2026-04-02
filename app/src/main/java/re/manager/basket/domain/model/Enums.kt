package re.manager.basket.domain.model

enum class Position(val id: Int) {
    NONE(0),
    PG(1),
    SG(2),
    SF(3),
    PF(4),
    C(5);

    companion object {
        fun fromId(id: Int) = entries.find { it.id == id } ?: NONE
    }
}

enum class Conference(val id: Int) {
    EAST(1),
    WEST(2);

    companion object {
        fun fromId(id: Int) = entries.find { it.id == id } ?: EAST
    }
}

enum class Division(val id: Int) {
    ATLANTIC(1),
    CENTRAL(2),
    SOUTHEAST(3),
    NORTHWEST(4),
    PACIFIC(5),
    SOUTHWEST(6);

    companion object {
        fun fromId(id: Int) = entries.find { it.id == id } ?: ATLANTIC
    }
}

enum class SeasonPhase {
    REGULAR_SEASON,
    PLAYOFFS,
    OFFSEASON_RENEWALS,
    OFFSEASON_DRAFT,
    OFFSEASON_FREE_AGENCY,
    NEW_SEASON_PREP
}
