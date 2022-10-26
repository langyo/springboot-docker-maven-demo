FROM maven:3.8.6-openjdk-18 AS builder

RUN mkdir /app
WORKDIR /app
COPY ./pom.xml /app
RUN mvn install

COPY ./src /app/src
RUN mvn package

FROM amazoncorretto:17

RUN mkdir /app
COPY --from=builder /app/target/app.jar /app/app.jar

WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]
