# Use a base image with Java 17
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Maven package into the container
COPY target/my-java-app.jar /app/my-java-app.jar

# Expose the port the app will run on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/my-java-app.jar"]
