wget https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.0.1-0-ppa4/ghostty_1.0.1-0.ppa4_amd64_24.04.deb

sudo dpkg -i ghostty_1.0.1-0.ppa4_amd64_24.04.deb

# Install Oh My ZSH
if [[ ! -e ~/.oh-my-zsh ]]; then
    echo "[*] Ready to install Oh-My-Zsh"
    echo "[!] Please re-run this script after Oh-My-Zsh is installed."
    read -p "Press Enter key to continue..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
fi

# Custom GhosTTY configs
cp ghostty_configs $HOME/.config/ghostty/config

# Install PowerLevel10K
echo "[*] Installing PowerLevel10K..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i -e "s/^ZSH_THEME.*/ZSH_THEME=powerlevel10k\/powerlevel10k/g" ~/.zshrc

# Install Oh-My-ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/RobertDeRose/virtualenv-autodetect.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/virtualenv-autodetect
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i -e "s/^plugins=(.*)$/plugins=(git python docker zsh-autosuggestions autojump virtualenv-autodetect zsh-syntax-highlighting kube-ps1)/g" ~/.zshrc
