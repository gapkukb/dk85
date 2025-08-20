import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.jjj.dev"
            resValue(type = "string", name = "app_name", value = "JJJ2 DEV")
            buildConfigField(type = "String", name = "field_one", value = "\"example field one\"")
            buildConfigField(type = "char", name = "field_two", value = "\'y\'")
            buildConfigField(type = "double", name = "field_three", value = "20.0")
        }
        create("fat") {
            dimension = "flavor-type"
            applicationId = "com.jjj.fat"
            resValue(type = "string", name = "app_name", value = "JJJ2 FAT")
            buildConfigField(type = "String", name = "field_one", value = "\"example field one\"")
            buildConfigField(type = "char", name = "field_two", value = "\'y\'")
            buildConfigField(type = "double", name = "field_three", value = "20.0")
        }
        create("uat") {
            dimension = "flavor-type"
            applicationId = "com.jjj.jjj2"
            resValue(type = "string", name = "app_name", value = "JJJ2 UAT")
            buildConfigField(type = "String", name = "field_one", value = "\"example field one\"")
            buildConfigField(type = "char", name = "field_two", value = "\'y\'")
            buildConfigField(type = "double", name = "field_three", value = "20.0")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.jjj.jjj2"
            resValue(type = "string", name = "app_name", value = "JJJ2")
            buildConfigField(type = "String", name = "field_one", value = "\"example field one\"")
            buildConfigField(type = "char", name = "field_two", value = "\'y\'")
            buildConfigField(type = "double", name = "field_three", value = "20.0")
        }
    }

    buildFeatures.buildConfig = true
}