#! /bin/bash

# Set script directory
mydir=$PWD

# Set up a temporary download folder and move into it
tempFolder="~/Desktop/tempDownloads/"
if [ -d "$tempFolder" ]
  then
    cd $tempFolder
    echo "Moved into temp download folder"
  else
    mkdir $tempFolder
    cd $tempFolder
    echo "Created temp download folder and moved into it"
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


# Install pdfmixtool
sudo snap install pdfmixtool

# nomacs
sudo apt install nomacs

# install minimal Gnome session (optional)
#sudo apt install gnome-session gnome-terminal -y


# Install SAGA GIS
sudo apt install saga -y

# TODO otb and monteverdi
# https://docs.qgis.org/3.22/en/docs/user_manual/processing/3rdParty.html?highlight=orfeo
sudo apt update

# Required packages to extract OTB from the archive
sudo apt install -y --no-install-recommends file python3 python3-dev python3-numpy

# Required packages to run OTB GUI tools AND recompile the Python bindings
sudo apt install -y --no-install-recommends '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev

# optional: prevent tzdata from asking the timezone during cmake installation
export DEBIAN_FRONTEND=noninteractive

# Required tools to recompile the bindings
sudo apt install -y --no-install-recommends g++ cmake make

# Download file
wget https://www.orfeo-toolbox.org/packages/OTB-8.0.0-Linux64.run

# Extract the archive
chmod +x OTB-8.0.0-Linux64.run
./OTB-8.0.0-Linux64.run




# Install QGIS
wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg

sudo add-apt-repository "deb https://qgis.org/ubuntu $(lsb_release -c -s) main"
sudo apt update && sudo apt install qgis qgis-plugin-grass


# TODO QGIS plugins?


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

# conda - requirements - environment

cd $mydir
conda update conda
conda env create -f environment.yml
conda activate geo
echo "conda activate geo"  >> ~/.bashrc


# Set-up code folders
codeFolder="~/Code"
if [ -d "$codeFolder" ]
  then
    echo "Code folder exists"
  else
    mkdir $codeFolder
    echo "Code folder created"
fi

# TODO set up github

# Install Docker
# uninstall previous versions
sudo apt remove docker docker-engine docker.io containerd runc

# set up repository
sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release

# add GPG key and set repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
# install docker packages
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

sudo docker run hello-world


#cd ..
echo "Software installed"

