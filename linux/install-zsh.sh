#!/bin/bash
# This script is intended to install a more handy shell and custom flavor for server management.
# Tested on Ubuntu server.


# exit when any command fails
set -e

sudo apt update -y && sudo apt install -y zsh

if [[ ! -e ~/.oh-my-zsh ]]; then
    echo "[*] Ready to install Oh-My-Zsh"
    echo "[!] Please re-run this script after Oh-My-Zsh is installed."
    read -p "Press Enter key to continue..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
fi

# Install Oh-My-ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/RobertDeRose/virtualenv-autodetect.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/virtualenv-autodetect
sed -i "s/^plugins=(.*)$/plugins=(git docker zsh-autosuggestions virtualenv-autodetect kube-ps1)/g" ~/.zshrc

# Change ZSH theme
sed -i "s/^ZSH_THEME.*/ZSH_THEME=bira/g" ~/.zshrc

# Change ZSH autosuggestion color to fit OneDark theme
echo "# ZSH autosuggestion color" >> ~/.zshrc
echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'" >> ~/.zshrc

# Add kubectl auto-completion
echo "" >> ~/.zshrc
echo "# ZSH Auto-Completion" >> ~/.zshrc
echo 'source <(kubectl completion zsh)' >> ~/.zshrc
echo 'source <(helm completion zsh)' >> ~/.zshrc

# Add aliases
echo "" >> ~/.zshrc
echo "# Aliases" >> ~/.zshrc
echo "alias kubectx='kubectl config use-context'" >> ~/.zshrc

# Prompt for Git configurations
read -p "Enter your Git username: " git_username
read -p "Enter your Git email: " git_email

# Custom GIT configs
git config --global user.name "$git_username"
git config --global user.email "$git_email"
git config --global --add --bool push.autoSetupRemote true
git config --global pull.rebase true
git config --global credential.helper cache --timeout=3600
git config --global fetch.prune true

# Set default shell to zsh without root privileges
echo "
# Run zsh
if command -v zsh >/dev/null 2>&1; then
    exec zsh
fi
" >> ~/.profile

# Run ZSH shell now if current is not
if [ "$(basename "$SHELL")" != "zsh" ]; then
  export SHELL=$(command -v zsh)
  exec zsh
fi
