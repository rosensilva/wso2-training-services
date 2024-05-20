# Use Eclipse Temurin JDK as a parent image
FROM eclipse-temurin:11-jre

# Set the working directory in the container
WORKDIR /app

# Copy the jar file into the container at /app
COPY ./hello.jar /app/hello.jar

# Make port 80 available to the world outside this container
EXPOSE 80

# Create a user "appuser" with no password, no home directory, and no shell
# (the user ID 10014 is used here as an example; adjust as necessary)
RUN useradd --system --uid 10014 --shell /bin/false appuser

# Change the owner of the /app directory to "appuser"
RUN chown -R appuser /app

# Run the container as the non-root user "appuser"
USER appuser

# Run the jar file
ENTRYPOINT ["java", "-jar", "hello.jar"]
