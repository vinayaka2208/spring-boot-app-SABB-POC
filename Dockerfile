#Here i selected java11 Base Image
FROM adoptopenjdk/openjdk11:alpine-jre

MAINTAINER VINAYAKA

COPY  /target/spring-boot-web.jar my-app.jar

EXPOSE 8085

ENTRYPOINT ["java","-jar"."my-app.jar"]

