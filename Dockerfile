FROM alpine
RUN pwd
RUN ls
COPY -R app /app
RUN cd app
RUN pwd
RUN ls

FROM maven:3.5-jdk-8-alpine
RUN ls
WORKDIR /app
RUN pwd
RUN mvn install
FROM openjdk:8-jre-alpine
RUN pwd
WORKDIR /app
COPY --from=1 /app/target/gs-spring-boot-0.1.0.jar /app
CMD ["java -jar gs-spring-boot-0.1.0.jar"]
