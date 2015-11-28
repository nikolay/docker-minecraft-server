FROM phusion/baseimage
MAINTAINER nikolay

ENV MINECRAFT_VERSION 1.8.8

RUN apt-get update && apt-get install -y default-jre-headless

RUN useradd -m -d /minecraft minecraft

ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/minecraft_server.${MINECRAFT_VERSION}.jar /minecraft/minecraft_server.jar
ADD eula.txt /minecraft/eula.txt

RUN chown minecraft:minecraft /minecraft/*

RUN mkdir /etc/service/minecraft
ADD minecraft.sh /etc/service/minecraft/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 25565