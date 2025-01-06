#!/bin/bash

# Variables
HELM_VERSION="v3.16.3"
HELM_URL="https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz"
DEST_DIR="$HOME/.local/bin"
HELM_BINARY="$DEST_DIR/helm"

# Ensure destination directory exists
mkdir -p "$DEST_DIR"

# Check if Helm is already installed and its version
if command -v helm &>/dev/null; then
    CURRENT_VERSION=$(helm version --short | awk '{print $1}')
    echo "Current Helm version: $CURRENT_VERSION"
else
    echo "Helm is not installed."
fi

# Inform about the update/install process
echo "Installing/Updating Helm to version ${HELM_VERSION}..."

# Download and install/update Helm
curl -sSL "$HELM_URL" | tar -xz -C "$DEST_DIR" --strip-components=1 linux-amd64/helm || { 
    echo "Failed to download or extract Helm"; exit 1; 
}

# Set executable permissions
chmod +x "$HELM_BINARY" || { 
    echo "Failed to set permissions"; exit 1; 
}

# Install helm-diff plugin
helm plugin install https://github.com/databus23/helm-diff

# Confirm success
echo "Helm ${HELM_VERSION} installed successfully to $HELM_BINARY"