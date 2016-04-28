# XCode Project File Parser
I tried the project: [xcode-project-parser](https://github.com/mestevens/xcode-project-parser) to parse xcode project file. But it is too slow because `String` objects are created/destroyed constantly. So I implement a parser using antlr4. And the project also contains a demo.

## Gradle Project Structure
    | 
    |--build.gradle
    |--settings.gradle
    |--demo 
    |       | 
    |       |--build.gradle
    |       |--src/main/java
    |       |--src/main/resources
    |--antlr4-xcode 
    |       | 
    |       |--build.gradle
    |       |--src/main/antlr 

## Build
*   cd to project folder
*   perform `gradlew.bat build` in terminal
*   open project using Intellij Idea
