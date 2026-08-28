import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("org.jetbrains.kotlin.plugin.compose")
}

android {
    namespace = "top.maary.basketmanager.re"
    compileSdk = 35

    defaultConfig {
        applicationId = "top.maary.basket_manager_re"
        minSdk = 24
        targetSdk = 35
        versionCode = 100
        versionName = "1.0.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
    }

    val keystorePropertiesFile = rootProject.file("keystore.properties")
    val keystoreFile = rootProject.file("keystore.jks")

    signingConfigs {
        if (keystorePropertiesFile.exists() && keystoreFile.exists()) {
            create("release") {
                val keystoreProperties = Properties().apply {
                    load(FileInputStream(keystorePropertiesFile))
                }
                val sPassword = keystoreProperties.getProperty("storePassword")
                    ?: keystoreProperties.getProperty("SIGNING_STORE_PASSWORD")
                    ?: System.getenv("SIGNING_STORE_PASSWORD")
                val kAlias = keystoreProperties.getProperty("keyAlias")
                    ?: keystoreProperties.getProperty("SIGNING_KEY_ALIAS")
                    ?: System.getenv("SIGNING_KEY_ALIAS")
                val kPassword = keystoreProperties.getProperty("keyPassword")
                    ?: keystoreProperties.getProperty("SIGNING_KEY_PASSWORD")
                    ?: System.getenv("SIGNING_KEY_PASSWORD")

                if (!sPassword.isNullOrBlank() && !kAlias.isNullOrBlank() && !kPassword.isNullOrBlank()) {
                    storeFile = keystoreFile
                    storePassword = sPassword
                    keyAlias = kAlias
                    keyPassword = kPassword
                }
            }
        }
    }

    val releaseSigning = signingConfigs.findByName("release")
    val hasValidReleaseSigning = releaseSigning?.storeFile != null && !releaseSigning.storePassword.isNullOrBlank()

    buildTypes {
        release {
            signingConfig = if (hasValidReleaseSigning) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            if (hasValidReleaseSigning) {
                signingConfig = signingConfigs.getByName("release")
            }
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildFeatures {
        compose = true
    }

    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.15.0")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.7")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.7")
    implementation("androidx.activity:activity-compose:1.9.3")

    val composeBom = platform("androidx.compose:compose-bom:2024.10.01")
    implementation(composeBom)
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material-icons-extended")
    implementation("androidx.navigation:navigation-compose:2.8.3")

    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.9.0")
    implementation("com.google.code.gson:gson:2.11.0")

    testImplementation("junit:junit:4.13.2")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.9.0")
    androidTestImplementation("androidx.test.ext:junit:1.2.1")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.6.1")
    androidTestImplementation(composeBom)
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}
