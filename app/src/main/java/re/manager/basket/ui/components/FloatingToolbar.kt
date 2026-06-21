package re.manager.basket.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.List
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import re.manager.basket.ui.navigation.Screen

@Composable
fun FloatingToolbar(
    currentRoute: String?,
    onNavigate: (String) -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .padding(bottom = 16.dp),
        contentAlignment = Alignment.BottomCenter
    ) {
        Surface(
            shape = CircleShape,
            color = MaterialTheme.colorScheme.surfaceVariant,
            tonalElevation = 8.dp,
            shadowElevation = 8.dp
        ) {
            Row(
                modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                ToolbarItem(
                    icon = androidx.compose.material.icons.Icons.Filled.Home,
                    label = "看台",
                    selected = currentRoute == Screen.Dashboard.route,
                    onClick = { onNavigate(Screen.Dashboard.route) }
                )
                ToolbarItem(
                    icon = androidx.compose.material.icons.Icons.Filled.Person,
                    label = "球队",
                    selected = currentRoute == Screen.FranchiseHub.route,
                    onClick = { onNavigate(Screen.FranchiseHub.route) }
                )
                ToolbarItem(
                    icon = androidx.compose.material.icons.Icons.Filled.List,
                    label = "办公",
                    selected = currentRoute == Screen.FrontOfficeHub.route,
                    onClick = { onNavigate(Screen.FrontOfficeHub.route) }
                )
            }
        }
    }
}

@Composable
private fun ToolbarItem(
    icon: ImageVector,
    label: String,
    selected: Boolean,
    onClick: () -> Unit
) {
    val containerColor = if (selected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceVariant
    val contentColor = if (selected) MaterialTheme.colorScheme.onPrimaryContainer else MaterialTheme.colorScheme.onSurfaceVariant

    FilledTonalIconButton(
        onClick = onClick,
        colors = IconButtonDefaults.filledTonalIconButtonColors(
            containerColor = containerColor,
            contentColor = contentColor
        ),
        modifier = Modifier.size(56.dp)
    ) {
        Icon(imageVector = icon, contentDescription = label)
    }
}
