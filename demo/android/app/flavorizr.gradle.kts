import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("app","channel")

    productFlavors {
        create("apple") {
            dimension = "app"
            applicationIdSuffix  = ".apple"
            resValue(type = "string", name = "app_name", value = "Apple App")
        }
        create("banana") {
            dimension = "app"
            applicationIdSuffix  = ".banana"
            resValue(type = "string", name = "app_name", value = "Banana App")
        }
        create("a001") {
            dimension = "channel"
            applicationIdSuffix  = ".a001"
        }
        create("a002") {
            dimension = "channel"
            applicationIdSuffix  = ".a002"
        }
    }
}