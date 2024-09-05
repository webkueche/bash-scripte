#!/bin/bash
echo "Mailcow wird installiert..."

apt update
apt upgrade -y
apt install -y curl
timedatectl set-timezone Europe/Berlin
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
systemctl enable --now docker
curl -L https://github.com/docker/compose/releases/download/v$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
apt install git -y
cd /opt
git clone https://github.com/mailcow/mailcow-dockerized
cd mailcow-dockerized
./generate_config.sh
docker compose pull
docker compose up -d

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
echo "Mailcow wurde erfolgreich installiert und gestartet!"
echo "Mailcow login: http://localhost"
echo ""
echo "Viel Spaß mit Mailcow"
