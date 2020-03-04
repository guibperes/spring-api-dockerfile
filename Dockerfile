FROM maven:3.6-jdk-8-alpine as MAVEN_BUILD

WORKDIR /build

COPY . .

RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/aula*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]
