import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Root build dir-ийг өөрчилж байгаа хэсэг
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.set(newBuildDir)

// Subprojects-ийн buildDir өөрчлөх
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    layout.buildDirectory.set(newSubprojectBuildDir)
    evaluationDependsOn(":app")
}

// clean task (Kotlin DSL хэлбэрээр)
tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}
