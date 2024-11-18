#!/bin/bash

if [[ -f ~/.bashrc ]]; then
    mv ~/.bashrc ~/.bashrc.bak
    echo "Your current .bashrc has been moved to .bashrc.bak"
fi

# TODO: Change to my own .bashrc
cp configs/.bashrc ~/.bashrc
source ~/.bashrc

if [[ $? -eq 0 ]]; then
    echo "new .bashrc has been added"
else
    echo ".bashrc copy error"
fi
