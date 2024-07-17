# Use an official Maven image as the base image
FROM jelastic/maven:3.9.5-openjdk-21 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src

# Executing maven build
RUN --mount=type=cache, target=/root/.m2 mvn -f $HOME/pom.xml clean package

# Setting jdk 21
FROM openjdk:21-jdk

WORKDIR /app

EXPOSE 9000

# Copy the built JAR file from the previous stage to the container
COPY --from=build /app/target/rail200-0.0.1-SNAPSHOT.jar .

# Run the app
CMD ["java", "-jar", "rail200-0.0.1-SNAPSHOT.jar"]