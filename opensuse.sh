#!/bin/bash

# System aktualisieren
zypper refresh
zypper update -y

# Installation der benötigten Pakete
zypper install -y \
    docker \
    docker-compose \
    git \
    wget \
    curl \
    net-tools \
    python3 \
    python3-pip \
    htop \
    nano \
    clamav \
    clamtk \
    apparmor \
    yast2-online-update-configuration  \
    xfce4 \
    lightdm \
    lightdm-gtk-greeter

# Docker-Setup
systemctl enable docker
systemctl start docker

# ClamAV und AppArmor aktivieren
systemctl enable clamav-freshclam
systemctl start clamav-freshclam

systemctl enable apparmor
systemctl start apparmor

# Nano als Standardeditor festlegen
update-alternatives --set editor /usr/bin/nano

# Docker Compose-Datei installieren und ausführen
if [ -f ./docker-compose.yml ]; then
    docker-compose up -d
else
    echo "Keine docker-compose.yml Datei im aktuellen Verzeichnis gefunden."
fi

# Tastaturlayout auf Deutsch setzen
localectl set-keymap de
localectl set-x11-keymap de

# Locale auf Deutsch setzen
localectl set-locale LANG=de_DE.UTF-8

# LightDM als Standard-Display-Manager setzen
if [ -f /etc/sysconfig/displaymanager ]; then
    sed -i 's/^DISPLAYMANAGER=.*/DISPLAYMANAGER="lightdm"/' /etc/sysconfig/displaymanager
fi

# LightDM-Konfiguration für XFCE anpassen
cat <<EOL > /etc/lightdm/lightdm.conf
[Seat:*]
greeter-session=lightdm-gtk-greeter
user-session=xfce
EOL

# Beispielhafte Anpassungen des LightDM-Greeters
cat <<EOL > /etc/lightdm/lightdm-gtk-greeter.conf
[greeter]
background=/usr/share/backgrounds/xfce/default.jpg
theme-name=Greybird
icon-theme-name=elementary-xfce-dark
font-name=Sans 11
xft-antialias=true
xft-hintstyle=hintfull
xft-rgba=rgb
EOL

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
python3 --version
pip3 --version
htop --version
nano --version
clamdscan --version
apparmor_status
echo "XFCE Desktop Environment, LightDM und andere Pakete wurden erfolgreich installiert und konfiguriert."
