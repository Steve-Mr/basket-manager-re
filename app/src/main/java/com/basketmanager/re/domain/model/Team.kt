package com.basketmanager.re.domain.model

data class Team(
    val id: Long = 0,
    val gameId: Long = 0,
    val name: String, // e.g. "BOS"
    val fullName: String = name,
    val conference: Conference,
    val division: Division,
    val salaryCap: Int,
    val colorHex: String = "#1E88E5"
) {
    companion object {
        fun getDefaultSalaryCap(name: String): Int {
            return when (name) {
                "BOS", "CHI", "MIA", "DAL", "HOU", "SAN", "LAC", "LAL", "NYK", "BRO" -> 80_000_000
                "TOR", "IND", "OKC", "GSW" -> 75_000_000
                "CLE", "ORL", "WAS", "NOR", "POR", "SAC" -> 70_000_000
                "ATL", "CHA", "DEN" -> 65_000_000
                "DET", "PHO", "UTA", "MIN" -> 60_000_000
                "PHI", "MIL", "MEM" -> 55_000_000
                else -> 70_000_000
            }
        }

        fun getTeamColor(name: String): String {
            return when (name) {
                "ATL" -> "#01244C"
                "BOS" -> "#05854C"
                "CHA" -> "#29588B"
                "CHI" -> "#D4001F"
                "CLE" -> "#9F1425"
                "DAL" -> "#006AB5"
                "DEN" -> "#4393D1"
                "DET" -> "#006BB6"
                "GSW" -> "#002942"
                "HOU" -> "#CC0000"
                "IND" -> "#002E62"
                "LAC" -> "#EE2944"
                "LAL" -> "#4A2583"
                "MEM" -> "#001B41"
                "MIA" -> "#B62630"
                "MIL" -> "#00330A"
                "MIN" -> "#015287"
                "BRO" -> "#000000"
                "NOR" -> "#002B5C"
                "NYK" -> "#0953A0"
                "OKC" -> "#007DC3"
                "ORL" -> "#0047AB"
                "PHI" -> "#D0103A"
                "PHO" -> "#1C105E"
                "POR" -> "#222222"
                "SAC" -> "#753BBD"
                "SAN" -> "#111111"
                "TOR" -> "#B31B1B"
                "UTA" -> "#00275D"
                "WAS" -> "#002244"
                else -> "#1E88E5"
            }
        }
    }
}
