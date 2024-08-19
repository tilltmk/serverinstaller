#!/bin/bash

# Update des Paketmanagers und Upgrade des Systems
apt-get update -y
apt-get upgrade -y

# Installation der benötigten Pakete
apt-get install -y \
    docker.io \
    docker-compose \
    git \
    wget \
    curl \
    net-tools \
    tasksel \
    python3 \
    python3-pip \
    htop \
    nano \
    clamav \
    clamtk \
    apparmor \
    unattended-upgrades \
    locales

# Automatische Updates aktivieren
dpkg-reconfigure --priority=low unattended-upgrades

# ClamAV und AppArmor aktivieren
systemctl enable clamav-freshclam
systemctl start clamav-freshclam

systemctl enable apparmor
systemctl start apparmor

# XFCE-Desktop-Environment installieren
tasksel install xfce-desktop

# Nano als Standardeditor festlegen
update-alternatives --set editor /bin/nano

# Docker-Setup
systemctl enable docker
systemctl start docker

# Docker Compose-Datei installieren und ausführen
if [ -f ./docker-compose.yml ]; then
    docker-compose up -d
else
    echo "Keine docker-compose.yml Datei im aktuellen Verzeichnis gefunden."
fi

# Tastaturlayout auf Deutsch setzen
sed -i 's/^XKBLAYOUT=.*/XKBLAYOUT="de"/' /etc/default/keyboard
setxkbmap de

# Locale auf Deutsch setzen
sed -i 's/^# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
update-locale LANG=de_DE.UTF-8

# Ausführen eines spezifischen install.sh Skripts, falls vorhanden
if [ -f ./install.sh ]; then
    chmod +x ./install.sh
    ./install.sh
else
    echo "Keine install.sh Datei im aktuellen Verzeichnis gefunden."
fi

# Abschließende Überprüfung und Meldung
echo "Installation abgeschlossen. Überprüfen Sie die installierten Pakete:"
docker --version
docker-compose --version
git --version
wget --version
curl --version
ifconfig --version
python3 --version
pip3 --version
htop --version
nano --version
clamdscan --version
apparmor_status
echo "XFCE Desktop Environment und andere Pakete wurden erfolgreich installiert und konfiguriert."