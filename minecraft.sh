#!/usr/bin/env bash

cd /minecraft
exec /sbin/setuser minecraft java -Xmx1G -Xms1G -jar minecraft_server.jar 2>&1 | logger