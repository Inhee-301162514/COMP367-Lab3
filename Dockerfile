FROM openjdk:17-alpine

RUN apk add --no-cache maven

WORKDIR /webApp

COPY . /webApp

EXPOSE 9090

CMD ["mvn", "tomcat7:run"]
