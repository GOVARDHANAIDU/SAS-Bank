# Use the official Tomcat 9 image
FROM tomcat:9.0

# Remove default Tomcat webapps (optional but cleaner)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the webapps directory
COPY target/SAS_Bank.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat (CMD is default in base image)
