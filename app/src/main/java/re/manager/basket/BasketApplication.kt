package re.manager.basket

import android.app.Application
import re.manager.basket.data.AppDatabase

class BasketApplication : Application() {
    val database by lazy { AppDatabase.getDatabase(this) }
}
