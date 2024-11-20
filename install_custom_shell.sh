#!/bin/bash
# exit when any command fails
set -e

# Install Oh My ZSH
if [[ ! -e ~/.oh-my-zsh ]]; then
    echo "[*] Ready to install Oh-My-Zsh"
    echo "[!] Please re-run this script after Oh-My-Zsh is installed."
    read -p "Press Enter key to continue..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
fi


# Install fonts
echo "[*] Downloading fonts if not exists (MesloLGS NF)..."
if [[ ! -e "$HOME/Library/Fonts/MesloLGS NF Regular.ttf" ]]; then
    wget -q --show-progress -P $HOME/Library/Fonts/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf
fi
if [[ ! -e "$HOME/Library/Fonts/MesloLGS NF Bold.ttf" ]]; then
    wget -q --show-progress -P $HOME/Library/Fonts/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold.ttf
fi
if [[ ! -e "$HOME/Library/Fonts/MesloLGS NF Italic.ttf" ]]; then
    wget -q --show-progress -P $HOME/Library/Fonts/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Italic.ttf
fi
if [[ ! -e "$HOME/Library/Fonts/MesloLGS NF Bold Italic.ttf" ]]; then
    wget -q --show-progress -P $HOME/Library/Fonts/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold%20Italic.ttf
fi

# Configure Hyper preferences
echo "[*] Configuring HyperTerminal..."
# Change default font
sed -i '' "s/fontFamily: '/fontFamily: '\"MesloLGS NF\", /g" ~/.hyper.js
# Disable WebGL Rendering
sed -i '' "s/webGLRenderer: true/webGLRenderer: false/g" ~/.hyper.js
# Change theme to OneDark
sed -i '' "s/plugins: .*/plugins: \[\`hyper-one-dark-vivid\`\],/g" ~/.hyper.js
# Set default font weight to bold
sed -i '' "s/fontWeight: 'normal'/fontWeight: 'bold'/g" ~/.hyper.js


# Install PowerLevel10K
echo "[*] Installing PowerLevel10K..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '' "s/^ZSH_THEME.*/ZSH_THEME=powerlevel10k\/powerlevel10k/g" ~/.zshrc

# Remove % sign when starting SHELL
sed -i '' '1s/^/# Sleep a short time to prevent showing % sign\nsleep 0.5\n/' ~/.zshrc

# Install Oh-My-ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/RobertDeRose/virtualenv-autodetect.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/virtualenv-autodetect
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '' "s/^plugins=(.*)$/plugins=(git python docker osx zsh-autosuggestions autojump virtualenv-autodetect zsh-syntax-highlighting kube-ps1)/g" ~/.zshrc

# Always show kube context
sed -i '' '/^[^#]*typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND=/s/^/#/' ~/.p10k.zsh
