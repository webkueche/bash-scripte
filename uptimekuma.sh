#!/bin/bash
echo "Uptime Kuma wird installiert..."

apt update
apt upgrade -y
apt install -y curl
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
systemctl start docker
systemctl start docker.service
docker volume create uptime-kuma
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:latest

echo "
   _____       .___                      
  /  _  \    __| _/____    _____   ______
 /  /_\  \  / __ |\__  \  /     \ /  ___/
/    |    \/ /_/ | / __ \|  Y Y  \\___ \ 
\____|__  /\____ |(____  /__|_|  /____  >
        \/      \/     \/      \/     \/ 
"                                
echo "www.proxserver.de"
echo ""
echo "Uptime Kuma wurde erfolgreich installiert und gestartet!"
echo "Uptime Kuma login: http://localhost:3001"
echo ""
echo "Viel Spaß beim monitoren mit UptimeKuma"
