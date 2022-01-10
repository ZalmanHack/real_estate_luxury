#!/usr/bin/env bash

echo '---- Clean package -------------------'
mvn clean

echo '---- Build package -------------------'
mvn package

echo '---- Copy files to server ------------'
scp -P 7822 target/realestate.war root@103.72.77.90:/var/lib/tomcat9/webapps/ROOT.war

echo '---- Complete ------------------------'