FROM ubuntu:14.04
MAINTAINER nikolay

ENV MINECRAFT_VERSION 1.8.8
ENV EULA true
ENV JVM_OPTS -Xms1G -Xmx1G

RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless

ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/minecraft_server.${MINECRAFT_VERSION}.jar /srv/minecraft_server.jar

VOLUME /data
WORKDIR /data

EXPOSE 25565

CMD java -jar /srv/minecraft_server.jar nogui
