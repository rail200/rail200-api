# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11-slim AS build
# Setting jdk 21
FROM openjdk:21-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src

# Executing maven build
RUN mvn clean package

EXPOSE 9000

# Copy the built JAR file from the previous stage to the container
COPY --from=build /app/target/rail200-0.0.1-SNAPSHOT.jar .

# Run the app
CMD ["java", "-jar", "rail200-0.0.1-SNAPSHOT.jar"]