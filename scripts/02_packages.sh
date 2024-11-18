#!/bin/bash
clear
echo "Installing packages"


# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update
sudo dnf install code # or code-insiders

# Podman 
sudo dnf -y install podman

# Ranger
sudo dnf -y install ranger

# duf
sudo dnf -y install duf

# Thunar
sudo dnf -y install thunar

# Gedit
sudo dnf -y install gedit

# Micro
sudo dnf -y install micro

# VLC
sudo dnf -y install vlc

# utilities
sudo dnf -y install feh curl tree gammastep 

