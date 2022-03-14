#!/bin/bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl zip wget -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -