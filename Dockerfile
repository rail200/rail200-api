# Setting jdk 21
FROM openjdk:21-jdk

# Setting container working directory
WORKDIR /app

# Copying files to the container working directory
COPY . .

# Executing maven build
RUN ./mvnw clean package

# Run the app
CMD ["java", "-jar", "target/rail200-0.0.1-SNAPSHOT.jar"]