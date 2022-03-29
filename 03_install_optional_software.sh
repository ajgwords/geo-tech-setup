#! /bin/bash

# Set up a temporary download folder and move into it
tempFolder="~/Desktop/tempDownloads/"
if [ -d "$tempFolder" ]
  then
    cd $tempFolder
    echo "Moved into temp download folder"
  else
    mkdir $tempFolder
    cd $tempFolder
    echo "Created temp download folder"
fi


# Install Google Chrome
googleFile="google-chrome-stable_current_amd64.deb"
# IF FILE EXISTS IN DOWNLOAD LOCATION THEN IGNORE
if [ -f "$googleFile" ]
  then
    echo "file already downloaded"
  else
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo gdebi google-chrome-stable_current_amd64.deb
fi


# Install Vivaldi browser - https://itsfoss.com/install-vivaldi-ubuntu-linux/
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg

echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list

sudo apt update && sudoapt upgrade -y && sudo apt install vivaldi-stable -y


# TODO virtualbox - https://www.virtualbox.org/wiki/Linux_Downloads


# Install duf - enhanced disk usage utility
sudo apt install duf

# Install clamav antivirus - https://www.inmotionhosting.com/support/security/install-clamav-on-ubuntu/
sudo apt install clamav clamav-daemon -y

sudo systemctl stop clamav-freshclam && sudo freshclam && sudo systemctl start clamav-freshclam


# TODO create cronjob to run clamscan -r ~

# TODO pdfmixtool
#sudo snap install pdfmixtool

# nomacs
sudo apt install nomacs

# install minimal Gnome session (optional)
#sudo apt install gnome-session gnome-terminal -y


# Install SAGA GIS
sudo apt install saga -y

# Install QGIS
wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg

sudo add-apt-repository "deb https://qgis.org/ubuntu $(lsb_release -c -s) main"
sudo apt update && sudo apt install qgis qgis-plugin-grass


# TODO QGIS plugins?

# TODO otb and monteverdi
# https://docs.qgis.org/3.22/en/docs/user_manual/processing/3rdParty.html?highlight=orfeo


# Install VScode
sudo snap install --classic code # or code-insiders

# TODO VScode addins?

# Install Conda
miniConda="Miniconda3-py39_4.11.0-Linux-x86_64.sh"
# IF FILE EXISTS IN DOWNLOAD LOCATION THEN IGNORE
if [ -f "$miniConda" ]
  then
    echo "file already downloaded"
  else
    wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-x86_64.sh

bash Miniconda*.sh
fi

# TODO conda - requirements - environment
# Throws error as "For changes to take effect, close and re-open your current shell"
#conda update conda
#conda env create -f environment.yml
#echo "conda activate geo"  >> ~/.bashrc


# TODO Set-up code folders

# TODO set up github


cd ..
echo "Software installed"

