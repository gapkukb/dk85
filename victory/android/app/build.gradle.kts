import com.android.build.gradle.internal.api.ApkVariantOutputImpl // For APK output
import com.android.build.gradle.internal.api.BaseVariantOutputImpl // For AAB output (if needed)

import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release"){
            storeFile = file("../.keystore/key.jks") // 存储keystore或者是jks文件的路径
            storePassword = "victory" // 存储密码
            keyAlias = "vic" // 别名
            keyPassword = "victory" // 密码
            enableV1Signing = true
            enableV2Signing = true
            enableV3Signing = true
        }
    }

    buildTypes {
        release {
            applicationId = "com.jjj.jjj2.ddd2"
            signingConfig = signingConfigs.getByName("release")
        }
    }

    lint {
        checkReleaseBuilds = false
    }

    applicationVariants.all {
        if (buildType.name != "release") return@all
        val sdf = SimpleDateFormat("yyyyMMdd_HHmm", Locale.US)
        val currentDateAndTime = sdf.format(Date())
        outputs.filterIsInstance<ApkVariantOutputImpl>().forEach { output ->
            output.outputFileName = "${defaultConfig.applicationId}_$currentDateAndTime.apk"
        }
    }
}

flutter {
    source = "../.."
}



dependencies {
    implementation("androidx.appcompat:appcompat:1.7.1")
    implementation("com.geyifeng.immersionbar:immersionbar:3.2.2")
}
