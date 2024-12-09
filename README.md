# geo-tech-setup
## what is this?
This is an attempt to create a working but relatively lightweight linux installation for use with geospatial tools i.e. something that I will be running as my daily driver for both work and personal machines.

## get started with the install 
1) download Fedora Sway: https://fedoraproject.org/spins/sway
2) install Fedora Sway (make sure that you have sudo set up - tick "add administrative privilages to this user account")
3) optional distro upgrade **
4) install git
5) clone this repo 
6) run bash install.sh

** see https://linuxiac.com/how-to-upgrade-fedora-linux-to-latest-release/ for full details but essentially you want to run the following commads:

1) `sudo dnf upgrade --refresh`
2) `sudo dnf install dnf-plugin-system-upgrade`
3) `sudo dnf system-upgrade download --releasever=xx` where xx is the version number to move to e.g. 41
4) `sudo dnf system-upgrade reboot`

and then run an optional clean using `sudo dnf clean all`


## more about the base install
Having been an Ubuntu and then Pop_OS user for over a decade I decided that I was getting frustrated with the amount of mess on the screen, but also loving the Pop_OS tiled windows. I also worked with someone using i3 as their daily window manager and liked it. I want to  be using future looking software so Sway , Wayland and Fedora all started to come into focus. 

Fedora should provide access to a stable working Sway system with aspects such as WiFi and blutooth already installed. This means that the specific changes I make are relatively minor and mainly involve how the user interacts with the system.

# notes about this repo 
Some of the tings that I have altered are 
* the font size in `foot`
* the bash prompt - to include conda environment and git branch 
* the scroll direction of the touchpad
* the key bindings (based on scripts and ideas from Just a Guy Linux - see below)

## thoughts
Is flatpak a sensible choice? I am trying to keep the system as lightweight and simple to administer as possible and I'm not sure if this is the best way to do that.

Change machine domain name if required (e.g. to gary): `sudo hostnamectl set-hostname gary`, and check with `hostnamectl`

## other
A. 

If localsend doesn't accept incoming information then there is likely an issue with the firewall on the machine with Fedora Sway - see https://docs.fedoraproject.org/en-US/quick-docs/firewalld/

It is possible to open the required port for this specific service.

1) Get a list of allowed ports in the current zone: `firewall-cmd --list-ports`
2) Add a port to the allowed ports to open it for incoming traffic: `sudo firewall-cmd --add-port=port-number/port-type` and then `sudo firewall-cmd --add-port=53317/tcp`
3) Make the new settings persistent: `sudo firewall-cmd --runtime-to-permanent`

Note: The port types (tcp, udp, sctp, dccp) must match the type of network communication.

 
B.

If you have issues with your screen, check out the following: https://www.lorenzobettini.it/2024/09/sway-monitor-configuration-for-different-computers/


# acknowledgements
Inspired by and in places largely borrowing from the excellent work created and shared by Just a Guy Linux:
* Youtube channel: https://www.youtube.com/@JustAGuyLinux 
* GitHub repo: https://github.com/drewgrif?tab=repositories

Also thanks to: 
* Learn Linux TV https://youtu.be/e7bezUA6G4g?si=yau1BEjBQhfMlJP5
* Bash Prompt Generator https://bash-prompt-generator.org
* Manjaro Sway https://github.com/manjaro-sway/desktop-settings/tree/sway/community/sway/etc/sway
for the ideas and resources shared with the world

If you are interested in how other folks do this, alternative configuration files can be found here: https://github.com/sandov/sway-configs-2023/tree/main and this is a great introduction on how to set up Sway from scratch: https://www.youtube.com/watch?v=QAmTUkzpIiM