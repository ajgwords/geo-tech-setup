#!/bin/bash

# run as root / using sudo

# check that sway is installed
# Check if the OS is Fedora by reading /etc/os-release
if grep '$ID=fedora' /etc/os-release; then
    echo "Operating system is Fedora."
else
    echo "Operating system is not Fedora."
    exit 1
fi

# Check if Sway window manager is running
if pgrep -x "sway" > /dev/null; then
    echo "Sway window manager is running."
else
    echo "Sway window manager is not running."
    exit 1
fi

echo "Both conditions are met: OS is Fedora and Sway is running."

# backgrounds - needs to be run as admin
exec sudo cp bg/tree.jpg /usr/share/backgrounds/tree.jpg # set as background in config. Edit that file to change bg.
exec sudo cp bg/fern.jpg /usr/share/backgrounds/fern.jpg # unused
exec sudo cp bg/default.png /usr/share/backgrounds/default.png # set as window manager bg. Rename any png to default.png to set. 
exec sudo cp bg/leaves.jpg /usr/share/backgrounds/leaves.jpg # unused
exec sudo cp bg/rain.jpg /usr/share/backgrounds/rain.jpg # unused

# check that config directories exist
# if not, create them

# Directories to check
sway_dir="$HOME/.config/sway"
foot_dir="$HOME/.config/foot"

# Check and create ~/.config/sway if it doesn't exist
if [ ! -d "$sway_dir" ]; then
    echo "Directory $sway_dir does not exist. Creating it now..."
    mkdir -p "$sway_dir"
else
    echo "Directory $sway_dir already exists."
fi

# Check and create ~/.config/foot if it doesn't exist
if [ ! -d "$foot_dir" ]; then
    echo "Directory $foot_dir does not exist. Creating it now..."
    mkdir -p "$foot_dir"
else
    echo "Directory $foot_dir already exists."
fi

# create a copy of any existing files and copy the config files from the repo into those folders
cp "$sway_dir"/config "$sway_dir"/config.bak 
cp "$foot_dir"/foot.ini "$foot_dir"/foot.ini.bak 

cp configs/config "$sway_dir"/config
cp configs/foot.ini "$foot_dir"/foot.ini 

#reload sway
swaymsg reload

# change .bashrc
bash scripts/add_bashrc.sh

# install base packages 
bash scripts/01_base.sh

# install dnf packages
bash scripts/02_packages.sh

# install flatpack (check it's not already installed)
# Check if Flatpak is installed
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak is not installed. Installing Flatpak..."

    # Detect the package manager and install Flatpak accordingly
    if command -v dnf &> /dev/null; then
        sudo dnf install -y flatpak
    elif command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y flatpak
    elif command -v pacman &> /dev/null; then
        sudo pacman -Syu flatpak
    else
        echo "Unsupported package manager. Please install Flatpak manually."
        exit 1
    fi

    echo "Flatpak has been installed successfully."
else
    echo "Flatpak is already installed."
fi

# install specific packages
bash scripts/03_fpack.sh

# install miniforge with mamba, create a geo env and install geopandas
bash scripts/04_python.sh

# install other things e.g. script to see keybindings etc  
# other people's choices e.g. nwg-look


clear


printf "\e[1;32mNow reboot for changes to be applied! Thank you.\e[0m\n"
