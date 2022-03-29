#! /bin/bash


sudo apt remove --purge libreoffice* -y
sudo apt remove --purge thunderbird firefox transmission -y
sudo apt remove --purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku gnome-2048 -y
sudo apt autoremove -y
echo "Software removed"
