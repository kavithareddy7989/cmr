FROM tomcat:9.0
COPY targets/my-app1.0-SNAPSHOT.jar /usr/local/tomcat9/webapps/my-app1.0-SNAPSHOT.jar
