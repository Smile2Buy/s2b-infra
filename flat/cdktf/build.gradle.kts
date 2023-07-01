/*
 * This file was generated by the Gradle 'init' task.
 */

plugins {
    `java-library`
    `maven-publish`
}

repositories {
    mavenLocal()
    maven {
        url = uri("https://repo.maven.apache.org/maven2/")
    }
}

dependencies {
    api("com.hashicorp:cdktf:0.17.0")
    api("software.constructs:constructs:10.0.25")
    api("junit:junit:4.13.2")
    api("org.junit.jupiter:junit-jupiter:5.8.0")
    api("com.hashicorp:cdktf-provider-aws:16.0.1")
    api("com.hashicorp:cdktf-provider-kubernetes:7.0.0")
}

group = "com.mycompany.app"
version = "0.1"
description = "cdktf"
java.sourceCompatibility = JavaVersion.VERSION_1_8

publishing {
    publications.create<MavenPublication>("maven") {
        from(components["java"])
    }
}

tasks.withType<JavaCompile>() {
    options.encoding = "UTF-8"
}

tasks.withType<Javadoc>() {
    options.encoding = "UTF-8"
}
