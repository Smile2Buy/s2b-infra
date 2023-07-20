plugins {
    `java-library`
    java
    application
}

repositories {
    mavenLocal()
    mavenCentral()
    maven {
        url = uri("https://repo.maven.apache.org/maven2/")
    }
}

dependencies {
    api("com.hashicorp:cdktf:0.17.1")
    api("software.constructs:constructs:10.0.25")
    api("junit:junit:4.13.2")
    api("org.junit.jupiter:junit-jupiter:5.8.0")
//    api("com.hashicorp:cdktf-provider-aws:16.0.1")
    implementation("com.hashicorp:cdktf-provider-random:8.0.0")
}

group = "com.s2b.infra"
version = "0.1"
description = "A CDKTF Application for Infrastructure of S2B"
java.sourceCompatibility = JavaVersion.VERSION_17

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

application {
    mainClass.set("com.s2b.infra.Main")
}

tasks.withType<JavaCompile> {
    options.encoding = "UTF-8"
}

tasks.withType<Javadoc> {
    options.encoding = "UTF-8"
}
