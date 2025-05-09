
plugins {
    kotlin("jvm") version "1.8.10"
}


allprojects {
    repositories {
        google()
        mavenCentral()
    }
}


val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)

   
    project.evaluationDependsOn(":app")

   
    dependencies {
        implementation("org.jetbrains.kotlin:kotlin-stdlib")
    }
}


tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
