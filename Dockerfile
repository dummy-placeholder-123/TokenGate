# ---- Stage 1: Build ----
FROM maven:3.9-amazoncorretto-21 AS build
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