#! /bin/bash

clear

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub installed" 
echo "+++++++++++++++++"
echo "Installing Flatpacks"

# Warehouse
flatpak install flathub io.github.flattool.Warehouse

# Localsend
flatpak install flathub org.localsend.localsend_app

# Vivaldi
flatpak install flathub com.vivaldi.Vivaldi

# Nomacs
flatpak install flathub org.nomacs.ImageLounge

# QGIS
flatpak install flathub org.qgis.qgis

# Gnumeric
flatpak install flathub org.gnumeric.Gnumeric

# Abiword
flatpak install flathub com.abisource.AbiWord

# Popsicle
flatpak install flathub com.system76.Popsicle


#
echo "Software installed"

