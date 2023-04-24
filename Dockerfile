#Here i selected java11 Base Image
FROM adoptopenjdk/openjdk11:alpine-jre

MAINTAINER VINAYAKA

COPY  /target/spring-boot-web.jar

EXPOSE 8085

ENTRYPOINT ["java","-jar"."spring-boot-web.jar"]

