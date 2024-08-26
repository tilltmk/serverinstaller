# 🚀 Server Installer

Dieses Repository enthält Skripte zur Automatisierung der Installation und Konfiguration eines Linux-Servers. Die Skripte umfassen die Einrichtung von Docker, Docker Compose, Git und anderen nützlichen Tools. Zusätzlich wird eine XFCE-Desktop-Umgebung installiert.

## 📂 Inhalte

- **`debian.sh`**: Das Hauptskript für die Installation und Konfiguration des Servers auf Debian-basierten Distributionen.
- **`specific-install-instructions.sh`**: Ein optionales Skript mit spezifischen Installationsanweisungen für zusätzliche Software oder Konfigurationen, die distributionsübergreifend gelten.
- **`docker-compose.yml`**: Eine Beispiel-Docker-Compose-Datei zur Einrichtung deiner Docker-Umgebung.

## 🛠️ Anforderungen

- Eine kompatible Linux-Distribution (Debian-basiert)
- Root-Zugriff auf das System

> [!WARNING]   
> Bitte stelle sicher, dass du über Root-Rechte verfügst, bevor du das Skript ausführst. Ohne die entsprechenden Berechtigungen schlägt die Installation fehl.

## 🚀 Installation

1. **Repository klonen:**
   ```bash
   git clone https://github.com/tilltmk/serverinstaller.git
   cd serverinstaller
   ```

2. **Das entsprechende Installationsskript für dein System auswählen:**
   - Für Debian-basierte Systeme:
     ```bash
     chmod +x debian.sh
     ./debian.sh
     ```

3. **Das Skript als Root-Benutzer ausführen.**

4. **Optional:** Wenn eine `specific-install-instructions.sh`-Datei im Verzeichnis vorhanden ist, wird diese nach Abschluss der Hauptinstallation automatisch ausgeführt.

> [!NOTE]  
> Das `specific-install-instructions.sh`-Skript ist nützlich, um benutzerdefinierte Einrichtungsschritte auszuführen, die spezifisch für deine Umgebung sind.

## 🌟 Features

- **Automatische Updates:** Sicherheitsupdates werden automatisch installiert, um dein System sicher zu halten.
- **ClamAV Antivirus:** Ein Virenscanner, der aktiviert und automatisch aktualisiert wird.
- **AppArmor:** Ein Sicherheitsframework, das standardmäßig installiert und aktiviert wird.
- **Docker & Docker Compose:** Zur Orchestrierung von Containern.
- **XFCE Desktop Environment und Lightdm:** Eine leichtgewichtige Desktop-Umgebung, die sich für die Fernverwaltung eignet.
- **Deutsches Tastaturlayout und Locale:** Das System wird so konfiguriert, dass es das deutsche Tastaturlayout und die deutsche Locale verwendet.
- **Nano als Standardeditor:** `nano` wird als Standard-Texteditor festgelegt.

> [!TIP]  
> Die Skripte sind modular aufgebaut, sodass du sie leicht an deine spezifischen Anforderungen anpassen kannst, indem du die bereitgestellte `specific-install-instructions.sh` modifizierst.

## 📜 Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die `LICENSE`-Datei für weitere Details.

> [!IMPORTANT]  
> Beiträge sind willkommen! Wenn du Probleme findest oder Vorschläge hast, eröffne gerne ein Issue oder reiche einen Pull Request ein.
