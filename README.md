# 🚀 Server Installer

This repository contains scripts to automate the installation and configuration of a Linux server. The scripts include the setup of Docker, Docker Compose, Git, and other useful tools. Additionally, an XFCE desktop environment will be installed.

## 📂 Contents

- **`debian.sh`**: The main script for installing and configuring the server on Debian-based distributions.
- **`opensuse.sh`**: The main script for installing and configuring the server on openSUSE.
- **`specific-install-instructions.sh`**: An optional script containing specific installation instructions for additional software or configurations that apply across multiple distributions.
- **`docker-compose.yml`**: A sample Docker Compose file to set up your Docker environment.

## 🛠️ Requirements

- A compatible Linux distribution (Debian-based, openSUSE, etc.)
- Root access to the system

> [!WARNING]   
> Please ensure you have root privileges before running the script. Without proper permissions, the installation will fail.

## 🚀 Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/tilltmk/serverinstaller.git
   cd serverinstaller
   ```

2. **Choose the appropriate installation script for your distribution:**
   - For Debian-based systems:
     ```bash
     chmod +x debian.sh
     ./debian.sh
     ```
   - For openSUSE systems:
     ```bash
     chmod +x opensuse.sh
     ./opensuse.sh
     ```

3. **Run the script as the root user.**

4. **Optional:** If there is a `specific-install-instructions.sh` file in the directory, it will be automatically executed after the main installation completes.

> [!NOTE]  
> The `specific-install-instructions.sh` script is useful for executing custom setup tasks that are specific to your environment.

## 🌟 Features

- **Automatic Updates:** Security updates are automatically installed to keep your system secure.
- **ClamAV Antivirus:** A virus scanner that is activated and kept updated automatically.
- **AppArmor:** A security framework that is installed and enabled by default.
- **Docker & Docker Compose:** For container orchestration.
- **XFCE Desktop Environment and Lightdm:** A lightweight desktop environment suitable for remote management.
- **German Keyboard Layout and Locale:** The system will be configured to use the German keyboard layout and locale.
- **Nano as Default Editor:** `nano` will be set as the default text editor.

> [!TIP]  
> The scripts are modular, so you can easily adapt them to fit your specific requirements by modifying the provided `specific-install-instructions.sh`.

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

> [!IMPORTANT]  
> Contributions are welcome! If you find any issues or have suggestions, feel free to open an issue or submit a pull request.
