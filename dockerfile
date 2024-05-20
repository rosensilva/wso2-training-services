# Use Eclipse Temurin JDK as a parent image
FROM eclipse-temurin:11-jre

# Set the working directory in the container
WORKDIR /app

# Copy the jar file into the container at /app
COPY ./hello.jar /app/hello.jar

# Make port 80 available to the world outside this container
EXPOSE 80

# Create a non-root user with UID 10014 (you can choose any UID that suits your security policies)
RUN useradd --uid 10014 --create-home --shell /bin/bash appuser

# Change ownership of the /app directory to the new user
RUN chown -R appuser:appuser /app

# Specify the user to run the container
USER 10014

# Run the jar file
ENTRYPOINT ["java", "-jar", "hello.jar"]
