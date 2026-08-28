package top.maary.basketmanager.re.domain.model

data class Tactic(
    val id: Long = 0,
    val gameId: Long = 0,
    val teamId: Long = 0,
    val gameType: Int = 0, // -2 (Conservative) .. +2 (Aggressive)
    val benchImportance: Int = 3, // 1..5
    val shotInteriorPercent: Int = 40, // 35..45
    val shotTriplePercent: Int = 40, // 35..45
    val starterPgId: Long? = null,
    val starterSgId: Long? = null,
    val starterSfId: Long? = null,
    val starterPfId: Long? = null,
    val starterCId: Long? = null,
    val reservePgId: Long? = null,
    val reserveSgId: Long? = null,
    val reserveSfId: Long? = null,
    val reservePfId: Long? = null,
    val reserveCId: Long? = null,
    val starOnePlayerId: Long? = null,
    val starTwoPlayerId: Long? = null,
    val starThreePlayerId: Long? = null
) {
    val starterIds: List<Long>
        get() = listOfNotNull(starterPgId, starterSgId, starterSfId, starterPfId, starterCId)

    val reserveIds: List<Long>
        get() = listOfNotNull(reservePgId, reserveSgId, reserveSfId, reservePfId, reserveCId)

    val rotationIds: List<Long>
        get() = starterIds + reserveIds

    val starIds: List<Long>
        get() = listOfNotNull(starOnePlayerId, starTwoPlayerId, starThreePlayerId)

    fun getPlayerIdForSlot(slot: LineupSlot): Long? {
        return when (slot) {
            LineupSlot.STARTER_PG -> starterPgId
            LineupSlot.STARTER_SG -> starterSgId
            LineupSlot.STARTER_SF -> starterSfId
            LineupSlot.STARTER_PF -> starterPfId
            LineupSlot.STARTER_C -> starterCId
            LineupSlot.RESERVE_PG -> reservePgId
            LineupSlot.RESERVE_SG -> reserveSgId
            LineupSlot.RESERVE_SF -> reserveSfId
            LineupSlot.RESERVE_PF -> reservePfId
            LineupSlot.RESERVE_C -> reserveCId
        }
    }

    fun findSlotForPlayer(playerId: Long): LineupSlot? {
        return LineupSlot.entries.find { getPlayerIdForSlot(it) == playerId }
    }

    /**
     * Assigns a player to a slot, automatically swapping them from their previous
     * position if they were already assigned elsewhere, preventing duplicate players in the lineup.
     */
    fun assignPlayerToSlot(targetSlot: LineupSlot, newPlayerId: Long): Tactic {
        val prevSlot = findSlotForPlayer(newPlayerId)
        if (prevSlot == targetSlot) return this

        val oldPlayerInTarget = getPlayerIdForSlot(targetSlot)

        fun setSlot(tactic: Tactic, slot: LineupSlot, pid: Long?): Tactic {
            return when (slot) {
                LineupSlot.STARTER_PG -> tactic.copy(starterPgId = pid)
                LineupSlot.STARTER_SG -> tactic.copy(starterSgId = pid)
                LineupSlot.STARTER_SF -> tactic.copy(starterSfId = pid)
                LineupSlot.STARTER_PF -> tactic.copy(starterPfId = pid)
                LineupSlot.STARTER_C -> tactic.copy(starterCId = pid)
                LineupSlot.RESERVE_PG -> tactic.copy(reservePgId = pid)
                LineupSlot.RESERVE_SG -> tactic.copy(reserveSgId = pid)
                LineupSlot.RESERVE_SF -> tactic.copy(reserveSfId = pid)
                LineupSlot.RESERVE_PF -> tactic.copy(reservePfId = pid)
                LineupSlot.RESERVE_C -> tactic.copy(reserveCId = pid)
            }
        }

        var result = setSlot(this, targetSlot, newPlayerId)
        if (prevSlot != null) {
            result = setSlot(result, prevSlot, oldPlayerInTarget)
        }
        return result
    }

    /**
     * Assigns a player to Star 1, Star 2, or Star 3, swapping star ranks if already assigned.
     */
    fun assignStar(starRank: Int, newPlayerId: Long?): Tactic {
        if (newPlayerId == null) {
            return when (starRank) {
                1 -> copy(starOnePlayerId = null)
                2 -> copy(starTwoPlayerId = null)
                else -> copy(starThreePlayerId = null)
            }
        }

        val prevRank = when (newPlayerId) {
            starOnePlayerId -> 1
            starTwoPlayerId -> 2
            starThreePlayerId -> 3
            else -> null
        }

        if (prevRank == starRank) return this

        val oldStarInTarget = when (starRank) {
            1 -> starOnePlayerId
            2 -> starTwoPlayerId
            else -> starThreePlayerId
        }

        var result = when (starRank) {
            1 -> copy(starOnePlayerId = newPlayerId)
            2 -> copy(starTwoPlayerId = newPlayerId)
            else -> copy(starThreePlayerId = newPlayerId)
        }

        if (prevRank != null) {
            result = when (prevRank) {
                1 -> result.copy(starOnePlayerId = oldStarInTarget)
                2 -> result.copy(starTwoPlayerId = oldStarInTarget)
                else -> result.copy(starThreePlayerId = oldStarInTarget)
            }
        }

        return result
    }
}
