# Build stage
FROM maven:3.5.2-jdk-9 AS builder
RUN mkdir /app
COPY app/* /app/
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package

# Run stage
FROM openjdk:9
COPY --from=builder /app/target/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/hello-world-0.0.1-SNAPSHOT.jar"]