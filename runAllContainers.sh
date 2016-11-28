#! /bin/bash

echo "Starting containers for Palpo Docker assignment..."

# Stop and remove  all containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Create new network
docker network create --subnet=172.20.0.0/16 palponet

# Haproxy; 172.20.0.2
docker run -d --name haproxy --net palponet --ip 172.20.0.2 -p 80:80 jukka/haproxy:1

# Frontend; 172.20.0.3
docker run -d --name frontend --net palponet --ip 172.20.0.3 jukka/frontend:1

# Logstash in; 172.20.0.4
docker run -d --name logstash_in --net palponet --ip 172.20.0.4 jukka/logstash_in:1

# RabbitMQ; 172.20.0.5
docker run -d --name rabbitmq --net palponet --ip 172.20.0.5 jukka/rabbitmq:1

# Logstash out; 172.20.0.6
docker run -d --name logstash_out --net palponet --ip 172.20.0.6 jukka/logstash_out:1

# MongoDB; 172.20.0.7
docker run -d --name mongo --net palponet --ip 172.20.0.7 -p 91:27017 -p 92:28017 mongo:3 mongod --rest

# Node; 172.20.0.8
docker run -d --name node --net palponet --ip 172.20.0.8 jukka/node:1

echo "Container start successful!"
