package re.manager.basket.util

object CurrencyUtils {
    fun formatCurrency(amount: Int): String {
        return "$${String.format("%,d", amount)}"
    }

    fun formatCurrency(amount: Long): String {
        return "$${String.format("%,d", amount)}"
    }
}
