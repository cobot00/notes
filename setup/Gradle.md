# Gradle

```bash
gradle init --type java-aplication

gradle eclipse
```

```groovy
apply plugin: 'java'
apply plugin: 'eclipse'

sourceCompatibility = 1.8
version = '1.0'

repositories {
    mavenCentral()
}

dependencies {
    testCompile group: 'junit', name: 'junit', version: '4.12'
}

tasks.withType(JavaCompile) {
    options.encoding = 'UTF-8'
}
```
