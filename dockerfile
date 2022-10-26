FROM maven:3.8.6-openjdk-18

RUN mkdir /app
WORKDIR /app
COPY ./pom.xml /app
RUN mvn install

COPY ./src /app/src
RUN mvn package

EXPOSE 8080
CMD ["mvn", "exec:java"]
