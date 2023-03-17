#!/bin/bash
# This script is intended to install a more handy shell and custom flavor for server management.
# Tested on Ubuntu server.


# exit when any command fails
set -e

sudo apt update -y
sudo apt install -y zsh

# Install Oh My ZSH
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
sed -i "s/^plugins=(.*)$/plugins=(git docker zsh-autosuggestions virtualenv-autodetect)/g" ~/.zshrc

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

# Install Oh-My-Tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf
cp .tmux.conf.local ~