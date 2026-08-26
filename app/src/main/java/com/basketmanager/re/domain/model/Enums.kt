package com.basketmanager.re.domain.model

enum class Conference(val id: Int, val titleResName: String) {
    EAST(1, "conference_east"),
    WEST(2, "conference_west");

    companion object {
        fun fromId(id: Int): Conference = entries.find { it.id == id } ?: EAST
    }
}

enum class Division(val id: Int, val conference: Conference, val titleResName: String) {
    E1_ATLANTIC(1, Conference.EAST, "division_e1"),
    E2_CENTRAL(2, Conference.EAST, "division_e2"),
    E3_SOUTHEAST(3, Conference.EAST, "division_e3"),
    W1_SOUTHWEST(4, Conference.WEST, "division_w1"),
    W2_NORTHWEST(5, Conference.WEST, "division_w2"),
    W3_PACIFIC(6, Conference.WEST, "division_w3");

    companion object {
        fun fromId(id: Int): Division = entries.find { it.id == id } ?: E1_ATLANTIC
    }
}

enum class Position(val id: Int, val shortName: String) {
    NONE(0, "-"),
    POINT_GUARD(1, "PG"),
    SHOOTING_GUARD(2, "SG"),
    SMALL_FORWARD(3, "SF"),
    POWER_FORWARD(4, "PF"),
    CENTER(5, "C");

    companion object {
        fun fromId(id: Int): Position = entries.find { it.id == id } ?: NONE
    }
}

enum class NewsType(val iconResName: String) {
    ADVICE("news_advice"),
    INFO("news_info"),
    WON("news_won"),
    LOST("news_lost"),
    MVP("news_mvp"),
    INJURED("news_injured"),
    RECOVERY("news_recovery"),
    TRADE("news_trade"),
    TROPHY("news_trophy"),
    PLAYOFFS("news_playoffs"),
    WORLD_FINAL("news_world_final"),
    IMPROVE("news_improve"),
    DECLINE("news_decline")
}
