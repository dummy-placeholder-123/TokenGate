# ---- Stage 1: Build ----
# Use JDK + Maven image so the build can run; the JRE base cannot execute mvn.
FROM maven:3.9-eclipse-temurin-21-alpine AS build
WORKDIR /app

COPY pom.xml .
RUN mvn -q dependency:go-offline # get all deps and ready to go offline

COPY src ./src
RUN mvn -q package -DskipTests

# ---- Stage 2: Run ----
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
#--from=build  is needed as previous stage gets lost
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
