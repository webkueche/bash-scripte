#!/bin/bash
echo "Checkmk Kuma wird installiert..."

apt update
apt upgrade -y
apt install -y curl
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
systemctl start docker
systemctl start docker.service
docker container run -dit -p 8080:5000 -p 8000:8000 --tmpfs /opt/omd/sites/cmk/tmp:uid=1000,gid=1000 -v monitoring:/omd/sites --name monitoring -v /etc/localtime:/etc/localtime:ro --restart always checkmk/check-mk-raw:2.3.0-latest

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
echo "Checkmk wurde erfolgreich installiert und gestartet!"
echo "Checkmk login: http://localhost:8080"
echo "Default Zugangsdaten Benutzer:cmkadmin PW: Findest du nach der eingabe von: docker container logs monitoring"
echo ""
echo "Viel Spaß beim monitoren mit Checkmk"
