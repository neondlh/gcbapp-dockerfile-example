FROM maven:3.5-jdk-8-alpine
WORKDIR /app
RUN mvn install
FROM openjdk:8-jre-alpine
RUN pwd
WORKDIR /app
COPY --from=1 /app/target/gs-spring-boot-0.1.0.jar /app
CMD ["java -jar gs-spring-boot-0.1.0.jar"]
