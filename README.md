# geo-tech-setup
## what is this?
This is an attempt to create a working but relatively lightweight linux installation for use with geospatial tools i.e. something that I will be running as my daily driver for both work and personal machines.

## get started with the install 
1) download Fedora Sway:
2) install Fedora Sway (make sure that you have sudo set up)
3) optional distro upgrade
4) install git
5) clone this repo 
6) run bash install.sh

## more about the base install
Fedora Sway - link, about
tick "add administrative privilages to thi user account"

# notes about this repo 
do we need mamba install?
is flatpak a sensible choice?

change machine domain name if required


n.b need to change install script to copy bashrc aftermamba install

## other
If localsend doesn't accept incoming information
https://docs.fedoraproject.org/en-US/quick-docs/firewalld/

Opening a port
Through open ports, the system is accessible from the outside, which represents a security risk. Generally, keep ports closed and only open them if they are required for certain services.

Opening a port using the command line
Get a list of allowed ports in the current zone:

$ firewall-cmd --list-ports
Add a port to the allowed ports to open it for incoming traffic:

$ sudo firewall-cmd --add-port=port-number/port-type

sudo firewall-cmd --add-port=53317/tcp

Make the new settings persistent:

$ sudo firewall-cmd --runtime-to-permanent
The port types are either tcp, udp, sctp, or dccp. The type must match the type of network communication.


# acknowledgements
Inspired by and in places largely borrowing from the excellent work created and shared by Just a Guy Linux you tube channel and GitHub repo

Learn Linux TV https://youtu.be/e7bezUA6G4g?si=yau1BEjBQhfMlJP5

https://bash-prompt-generator.org

https://github.com/manjaro-sway/desktop-settings/tree/sway/community/sway/etc/sway

