# Stage 1: Build the WAR file using Maven
FROM maven:3.8.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Deploy WAR file to Tomcat
FROM iamdevopstrainer/tomcat:base

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"] 