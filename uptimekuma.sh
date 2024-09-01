#!/bin/bash

apt update
apt upgrade -y
apt install curl -y
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
systemctl start docker
systemctl start docker.service
docker volume create uptime-kuma
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:latest

echo "Uptime Kuma wurde erfolgreich installiert und gestartet!"
echo "Viel Spaß beim Monitoren Patrick"

echo "Uptime Kuma login: http://deineIP:3001"
