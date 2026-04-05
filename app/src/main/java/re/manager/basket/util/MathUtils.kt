package re.manager.basket.util

object MathUtils {
    /**
     * Converts a Double to an Int using rounding (adding 0.5 and truncating).
     * This ensures consistency with the original game's statistical conversion logic.
     */
    fun Double.toOriginalInt(): Int = (this + 0.5).toInt()
}
