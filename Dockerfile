FROM java:8

VOLUME /tmp

ADD /target/micro-zuul-0.0.1-SNAPSHOT.jar micro-zuul-0.0.1-SNAPSHOT.jar
RUN bash -c 'touch /micro-zuul-0.0.1-SNAPSHOT.jar'

EXPOSE 8090

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/micro-zuul-0.0.1-SNAPSHOT.jar"]