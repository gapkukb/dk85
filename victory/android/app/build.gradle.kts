plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // 多渠道打包
    id("com.tencent.vasdolly")
}

android {
    namespace = "com.example.victory"
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
        applicationId = "com.example.victory"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release"){
            storeFile = file("../keystore/key.jks") // 存储keystore或者是jks文件的路径
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
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}



dependencies {
    // 用于应用程序运行时读取渠道信息
    api("com.tencent.vasdolly:helper:3.0.6")
}

// VasDolly插件配置
// gradle channelDebug/channelRelease 编译生成apk后，再根据生成的Apk生成渠道包
channel {
    channelFile = file("../app_channel.txt")
    // 多渠道包的输出目录，默认为new File(project.buildDir,"channel")
    outputDir = File(layout.buildDirectory.get().asFile, "channels")
    // 多渠道包的命名规则，默认为：${appName}-${versionName}-${versionCode}-${flavorName}-${buildType}-${buildTime}
    apkNameFormat = "${'$'}{appName}-${'$'}{versionName}-${'$'}{versionCode}-${'$'}{flavorName}-${'$'}{buildType}"
    // 快速模式：生成渠道包时不进行校验（速度可以提升10倍以上，默认为false）
    fastMode = true
    // buildTime的时间格式，默认格式：yyyyMMdd-HHmmss
    buildTimeDateFormat = "yyyyMMdd-HH:mm:ss"
    // 低内存模式（仅针对V2签名，默认为false）：只把签名块、中央目录和EOCD读取到内存，不把最大头的内容块读取到内存，在手机上合成APK时，可以使用该模式
    lowMemory = false
}

// gradle rebuildChannel 配置此任务用于不希望重新构建apk，直接根据指定的apk生成渠道包
rebuildChannel {
    val path = layout.buildDirectory.get().asFile
    channelFile = file("../app_channel.txt")
    // 指定的apk生成渠道包,文件名中如果有base将被替换为渠道名，否则渠道名将作为前缀
    baseApk = File(path, "outputs/apk/debug/app-debug.apk")
    // 默认为new File(project.buildDir, "rebuildChannel")
    outputDir = File(path, "rebuildChannels")
    // 快速模式：生成渠道包时不进行校验（速度可以提升10倍以上，默认为false）
    fastMode = false
    // 低内存模式（仅针对V2签名，默认为false）：只把签名块、中央目录和EOCD读取到内存，不把最大头的内容块读取到内存，在手机上合成APK时，可以使用该模式
    lowMemory = false
}