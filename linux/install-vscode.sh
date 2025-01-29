#!/bin/bash

# Update system package list
echo "Updating package list..."
sudo apt update -y

# Install dependencies for downloading .deb files and adding repositories
echo "Installing dependencies..."
sudo apt install -y wget gpg

# Import Microsoft GPG key
echo "Importing Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg

# Add the VSCode repository
echo "Adding VSCode repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update the package list again
echo "Updating package list after adding repository..."
sudo apt update -y

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo apt install -y code

# Confirm installation
echo "Installation complete. You can now launch VSCode by typing 'code' in your terminal."

