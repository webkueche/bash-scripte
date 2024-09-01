#!/bin/bash

apt update

apt upgrade -y

apt install curl -y

curl -sSL https://get.docker.com/ | CHANNEL=stable sh

# Docker starten
systemctl start docker

systemctl start docker.service

# Docker Volume für Uptime Kuma erstellen
docker volume create uptime-kuma

# Uptime Kuma Container starten
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:latest

# Erfolgsmeldung
echo "Uptime Kuma wurde erfolgreich installiert und gestartet!"

wget https://github.com/Proxserver/sh/blob/main/uptimekuma.sh
chmod +x uptimekuma.sh
./uptimekuma.sh
