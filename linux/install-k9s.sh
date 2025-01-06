#!/bin/bash

# Variables
K9S_VERSION="v0.32.7"
K9S_URL="https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz"
DEST_DIR="$HOME/.local/bin"
K9S_BINARY="$DEST_DIR/k9s"

# Ensure destination directory exists
mkdir -p "$DEST_DIR"

# Check if k9s is already installed and its version
if command -v k9s &>/dev/null; then
    echo "Current k9s binary found at: $(command -v k9s)"
else
    echo "k9s is not installed."
fi

# Inform about the update/install process
echo "Installing/Updating k9s to version ${K9S_VERSION}..."

# Download and install/update k9s
curl -sSL "$K9S_URL" | tar -xz -C "$DEST_DIR" k9s || { 
    echo "Failed to download or extract k9s"; exit 1; 
}

# Set executable permissions
chmod +x "$K9S_BINARY" || { 
    echo "Failed to set permissions"; exit 1; 
}

# Confirm success
echo "k9s ${K9S_VERSION} installed successfully to $K9S_BINARY"