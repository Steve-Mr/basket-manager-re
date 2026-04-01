package re.manager.basket

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.launch
import re.manager.basket.data.importer.RosterImporter
import re.manager.basket.ui.theme.BasketManagerTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val app = application as BasketApplication
        val database = app.database

        lifecycleScope.launch {
            if (database.teamDao().getCount() == 0) {
                // Perform first-time initialization
                val importer = RosterImporter(this@MainActivity, database)
                importer.importFromAssets(gameId = 1)
            }
        }

        setContent {
            BasketManagerTheme {
                // Root Composable with Navigation
            }
        }
    }
}
