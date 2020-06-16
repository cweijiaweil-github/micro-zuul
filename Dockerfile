FROM openjdk:8u191-jre-alpine3.9

VOLUME /tmp

ADD /target/micro-zuul-0.0.1-SNAPSHOT.jar micro-zuul-0.0.1-SNAPSHOT.jar

EXPOSE 8090

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/micro-zuul-0.0.1-SNAPSHOT.jar"]