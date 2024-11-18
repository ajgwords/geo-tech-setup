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

# Step 3: Create the 'geo' environment with geopandas using mamba
if conda env list | grep -q "^$ENV_NAME\s"; then
    echo "The environment '$ENV_NAME' already exists."
else
    echo "Creating environment '$ENV_NAME' with geopandas..."
    mamba create -n "$ENV_NAME" -c conda-forge geopandas -y
    echo "Environment '$ENV_NAME' created and geopandas installed."
fi

echo "Setup complete. Use 'mamba activate $ENV_NAME' to activate the environment."
