# FROM maven:3-eclipse-temurin-17 AS build
# COPY . .
# RUN mvn clean package -Pprod -DskipTests
# FROM eclipse-temurin:17-alpine
# COPY --from=build /target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
# EXPOSE 8080
# CMD ["java", "-jar", "DogsManagementSystem.jar"]
FROM maven:3.8.3-openjdk-17 AS build 
COPY . . RUN mvn clean package -Pprod -DskipTests 
FROM openjdk:17-jdk-slim 
COPY --from=build /target/DogManagementSystem-0.0.1-SNAPSHOT.jar DogManagementSystem.jar 
CMD ["java", "-jar", "DogManagementSystem.jar"]
