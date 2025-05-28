#!/bin/bash
echo "Portainer wird installiert..."

apt update
apt upgrade -y
apt install -y curl
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
curl -SL https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker run -d -p 18510:8000 -p 19510:9000 --name portainer --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer-ce:latest

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
echo "Portainer wurde erfolgreich installiert und gestartet!"
echo "Portainer login: http://localhost:19510"
echo ""
echo "Viel Spaß mit Portainer und Docker"
