#!/bin/bash

if [ ! -x /usr/lib/docker ]; then
	echo "INSTALLING DOCKER"
	#updating list of packages..
	apt-get update -y
	#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
	sudo apt-get install ca-certificates curl gnupg lsb-release -y
	#Add Docker’s official GPG key:
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	#Use the following command to set up the repository:
	echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	#Install Docker Engine
	apt-get install docker docker-compose -y
	echo "Docker version $(docker --version) successfully installed"
else
	echo "docker version $(docker --version) already installed"
fi
