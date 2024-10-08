#!/bin/bash

# Verzeichnis für Freqtrade-Daten erstellen
mkdir -p ~/freqtrade/user_data
cp freqtrade-config.json ~/freqtrade/user_data/config.json
cd ~/freqtrade

# Docker-Compose-Datei herunterladen
curl https://raw.githubusercontent.com/freqtrade/freqtrade/stable/docker-compose.yml -o docker-compose.yml

# Docker-Image ziehen
docker-compose pull

# Benutzerverzeichnisstruktur erstellen
docker-compose run --rm freqtrade create-userdir --userdir user_data

# Konfigurationsdatei erstellen (interaktiv)
# docker-compose run --rm freqtrade new-config --config user_data/config.json

# Docker-Container im Hintergrund starten
docker-compose up -d

# Hinweis zur Konfiguration
echo "Die Konfigurationsdatei befindet sich in ~/freqtrade/user_data/config.json. Bitte bearbeiten Sie diese nach Ihren Bedürfnissen."

