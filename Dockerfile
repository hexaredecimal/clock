# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables to ensure non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages: git and JDK 17
RUN apt-get update && \
    apt-get install -y git openjdk-21-jdk vim && \
    apt-get clean

# Clone the repository and set the working directory
RUN cd ~ && \
    git clone https://github.com/hexaredecimal/clock.git && \
    cd clock

# Ensure the jar file is present and has the right permissions
RUN chmod +x clockserver-dist.jar

# Set the working directory
WORKDIR ~/clock

# Expose port 8080
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "clockserver-dist.jar"]


