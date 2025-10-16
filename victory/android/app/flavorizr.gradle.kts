import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("app","channel")

    productFlavors {
        create("jjj2") {
            dimension = "app"
            applicationIdSuffix  = ".jjj2"
            resValue(type = "string", name = "app_name", value = "JJJ2")
        }
        create("a001") {
            dimension = "channel"
            applicationIdSuffix  = ".a001"
        }
        create("a002") {
            dimension = "channel"
            applicationIdSuffix  = ".a002"
        }
        create("d001") {
            dimension = "channel"
            applicationIdSuffix  = ".d001"
        }
        create("d002") {
            dimension = "channel"
            applicationIdSuffix  = ".d002"
        }
        create("d003") {
            dimension = "channel"
            applicationIdSuffix  = ".d003"
        }
        create("d004") {
            dimension = "channel"
            applicationIdSuffix  = ".d004"
        }
        create("d005") {
            dimension = "channel"
            applicationIdSuffix  = ".d005"
        }
        create("d006") {
            dimension = "channel"
            applicationIdSuffix  = ".d006"
        }
        create("d007") {
            dimension = "channel"
            applicationIdSuffix  = ".d007"
        }
        create("d008") {
            dimension = "channel"
            applicationIdSuffix  = ".d008"
        }
        create("d009") {
            dimension = "channel"
            applicationIdSuffix  = ".d009"
        }
    }
}