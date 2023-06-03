FROM centos

MAINTAINER "Nidhi"

RUN mkdir /opt/tomcat/
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y update 
RUN yum upgrade
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.89/bin/apache-tomcat-8.5.89.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.89/* /opt/tomcat/.


#RUN yum -y install java

#ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.89/bin/apache-tomcat-8.5.89.tar.gz .
#RUN tar xvfz apache*.tar.gz
#RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
#RUN yum -y install java

WORKDIR /opt/tomcat/webapps
COPY target/my-app-1.0-SNAPSHOT.jar .

EXPOSE 8080
RUN /opt/tomcat/bin/catalina.sh
#CMD ["/opt/tomcat/bin/catalina.sh", "run"]
CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]

# select parent image
#FROM maven:3.6.3-jdk-8

# copy the source tree and the pom.xml to our new container
#COPY ./ ./

# package our application code
#RUN mvn clean package

# set the startup command to execute the jar
#CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]
