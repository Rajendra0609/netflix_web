# Use the official Tomcat 9 image as the base image
FROM tomcat:9

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

# Set Java Home environment variable (if not set automatically)
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Set the time zone to UTC
ENV TZ=IST

# Set Java options
ENV JAVA_OPTS="-Xms512m -Xmx1024m"

# Copy your WAR file into the webapps directory of Tomcat
COPY /var/lib/jenkins/workspace/netflix/target/my-web-app-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war


# Expose the default Tomcat port
EXPOSE 8081

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
