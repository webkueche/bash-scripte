#!/bin/bash

apt update
apt upgrade -y
apt install -y curl
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
systemctl start docker
systemctl start docker.service
docker volume create uptime-kuma
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:latest

echo "
______               _       ___      _                     
|  ___|             | |     / _ \    | |                    
| |_ __ _ _ __ _   _| | __ / /_\ \ __| | __ _ _ __ ___  ___ 
|  _/ _` | '__| | | | |/ / |  _  |/ _` |/ _` | '_ ` _ \/ __|
| || (_| | |  | |_| |   <  | | | | (_| | (_| | | | | | \__ \
\_| \__,_|_|   \__,_|_|\_\ \_| |_/\__,_|\__,_|_| |_| |_|___/
"                                                            
                                                            
echo "Uptime Kuma wurde erfolgreich installiert und gestartet!"
echo "Viel Spaß beim Monitoren mit UptimKuma"

echo "Uptime Kuma login: http://localhost:3001"
