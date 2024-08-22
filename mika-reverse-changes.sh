docker stop freqtrade
docker stop caddy
docker rm freqtrade
docker rm caddy
cd
cd serverinstaller
docker-compose up -d
sleep 10
docker stop freqtrade
docker rm freqtrade
dpkg-reconfigure --priority=low unattended-upgrades
