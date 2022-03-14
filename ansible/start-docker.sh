#!/bin/bash
#Create docker image
/usr/bin/docker build -t automation-nginx .
#Run docker container on port 8080
/usr/bin/docker run -d -p 8080:80 automation-nginx