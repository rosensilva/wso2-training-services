# Use Eclipse Temurin JDK as a parent image
FROM eclipse-temurin:11-jre

# Set the working directory in the container
WORKDIR /app

# Copy the jar file into the container at /app
COPY ./hello.jar /app/hello.jar

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "hello.jar"]
