# Use Maven to build the app
FROM maven:3.8.4-openjdk-11 as build

WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and compile it
COPY src /app/src
RUN mvn clean package -DskipTests

# Use a minimal JDK runtime for the final image
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the app will run on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
