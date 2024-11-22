#!/bin/bash

# Variables
MF_INSTALLER="Miniforge3-Linux-x86_64.sh"
CONDA_URL="https://github.com/conda-forge/miniforge/releases/latest/download/$MF_INSTALLER"
INSTALL_DIR="$HOME/miniforge3"
ENV_NAME="geo"

# Step 1: Download and install Miniforge if it isn't already installed
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Downloading Miniforge installer..."
    wget "$CONDA_URL" -O "$MF_INSTALLER"
    
    echo "Installing Miniforge..."
    bash "$MF_INSTALLER" -b -p "$INSTALL_DIR"
    
    # Initialize conda
    eval "$("$INSTALL_DIR/bin/conda" shell.bash hook)"
    
    echo "Miniforge installation complete."
    rm "$MF_INSTALLER"  # Clean up installer
else
    echo "Miniforge is already installed."
    # Initialize conda if it’s not already in the environment
    eval "$("$INSTALL_DIR/bin/conda" shell.bash hook)"
fi

# Step 2: Update conda and install mamba
echo "Updating conda..."
conda update -y conda

echo "Installing mamba in the base environment..."
conda install -n base -c conda-forge mamba -y

# Step 3: Add mamba to the .bashrc
MAMBA_INIT_SCRIPT='if [ -f "/home/al/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/al/miniforge3/etc/profile.d/mamba.sh"
fi'
BASHRC_FILE="$HOME/.bashrc"

# Check if the code is already present in .bashrc
if grep -Fxq "$MAMBA_INIT_SCRIPT" "$BASHRC_FILE"; then
    echo "The mamba initialization script is already present in your .bashrc file."
else
    # Add the code to .bashrc
    echo "Adding mamba initialization script to .bashrc file..."
    echo -e "\n# Mamba initialization" >> "$BASHRC_FILE"
    echo "$MAMBA_INIT_SCRIPT" >> "$BASHRC_FILE"
    echo "Success"
fi


# Step 4: Create the 'geo' environment with geopandas using mamba
if conda env list | grep -q "^$ENV_NAME\s"; then
    echo "The environment '$ENV_NAME' already exists."
else
    echo "Creating environment '$ENV_NAME' with geopandas..."
    mamba create -n "$ENV_NAME" -c conda-forge geopandas -y
    echo "Environment '$ENV_NAME' created and geopandas installed."
    echo "# Activate the '$ENV_NAME' environment on startup" >> "$bashrc_file"
    echo "mamba activate geo" >> "$bashrc_file"
    echo "Activation added successfully."
fi

source $HOME/.bashrc
echo "Python setup complete. 