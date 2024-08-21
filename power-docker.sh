#!/bin/bash

# Container Name abfragen
read -p "Bitte den Namen des Containers eingeben: " container_name

# CPU-Nutzung auf 90% einer CPU begrenzen
docker update --cpus="0.9" $container_name

# CPU-Priorität maximieren
docker update --cpu-shares="1024" $container_name

# Unbegrenzten Speicher und Swap zulassen
docker update --memory="0" --memory-swap="-1" $container_name

# Maximale CFS-Zeitscheibe (z.B. 1 Sekunde) und Quotendauer setzen
docker update --cpu-period="1000000" --cpu-quota="900000" $container_name

# Maximale Kernel-Speicherverwendung zulassen
docker update --kernel-memory="0" $container_name

# PIDs auf das Maximum setzen (unbegrenzt)
docker update --pids-limit="-1" $container_name

# Block I/O Priorität auf das Maximum setzen
docker update --blkio-weight="1000" $container_name

# Privilegierte Zugriffe erlauben
docker update --privileged=true $container_name

# OOM-Killer deaktivieren
docker update --oom-kill-disable=true $container_name

# Bestätigung anzeigen
echo "Der Container '$container_name' hat jetzt maximale Priorität und Ressourcenzugriff."
