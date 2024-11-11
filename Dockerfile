# Dockerfile
# Use Node 18 with Cypress-compatible browsers
FROM cypress/included:cypress-13.15.2-node-22.11.0-chrome-130.0.6723.116-1-ff-132.0.1-edge-130.0.2849.68-1

# Clean apt-get cache, update, and install Java
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y default-jdk

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Check Java installation path
RUN update-alternatives --display java && readlink -f $(which java)

# Verify installations
RUN node -v && java -version && google-chrome --version && firefox --version