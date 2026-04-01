package re.manager.basket

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import re.manager.basket.ui.theme.BasketManagerTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            BasketManagerTheme {
                // Main Navigation and Screens
            }
        }
    }
}
