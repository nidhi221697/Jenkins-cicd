FROM centos

MAINTAINER "Nidhi"

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
ADD https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java

WORKDIR /opt/tomcat/webapps
COPY my-app-1.0-SNAPSHOT.jar .

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]


# select parent image
#FROM maven:3.6.3-jdk-8

# copy the source tree and the pom.xml to our new container
#COPY ./ ./

# package our application code
#RUN mvn clean package

# set the startup command to execute the jar
#CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]
