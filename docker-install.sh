#!/bin/bash
# installing docker
sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

#add centos user to docker group
sudo groupadd docker
sudo usermod -aG docker centos