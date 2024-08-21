#!/bin/bash

# Container Name abfragen
read -p "Bitte den Namen des Containers eingeben: " container_name

# Minimale CPU-Nutzung setzen (z.B. 1% einer CPU)
docker update --cpus=".01" $container_name

# CPU-Priorität auf Minimum setzen
docker update --cpu-shares="2" $container_name

# Minimale Speicherzuweisung (z.B. 32MB)
docker update --memory="128m" $container_name

# Minimaler Swap-Speicher
docker update --memory-swap="32m" $container_name

# Geringste CFS-Zeitscheibe (z.B. 1ms) und Quotendauer auf Minimum setzen
docker update --cpu-period="100000" --cpu-quota="1000" $container_name

# Keine Verwendung von Kernel-Speicher
docker update --kernel-memory="16m" $container_name

# PIDs auf Minimum beschränken (z.B. 10 Prozesse)
docker update --pids-limit="10" $container_name

# Block I/O Priorität auf das Minimum setzen
docker update --blkio-weight="10" $container_name

# Bestätigung anzeigen
echo "Die Ressourcennutzung des Containers '$container_name' wurde auf das Minimum reduziert."
