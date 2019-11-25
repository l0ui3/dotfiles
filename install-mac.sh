#!/bin/bash

# Setup .bash prompt and aliases
#cp bash_profile ~/.bash_profile
#cp bash_prompt ~/.bash_prompt
cp bash_aliases ~/.bash_aliases

# Vim config
cp vimrc ~/.vimrc

# SSH config
cp ssh_config ~/.ssh/config

# TMUX config
cp tmux_conf ~/.tmux.conf

# Link iCloud folder to home
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud

# Install Homebrew (Interactive)
if [[ ! -e /usr/local/Homebrew ]]; then
	echo -e "[*] Homebrew is not installed, install now."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages by brew bundle
brew bundle

# Change theme to hyper terminal
sed -i '' 's/plugins: .*/plugins: \[`hyperterm-atom-dark`\],/g' ~/.hyper.js

echo "Install powerline font from https://github.com/powerline/fonts"
echo "Then, add 'Roboto Mono for Powerline' to FontFamily at ~/.hyper.js"
echo "Finally, install oh my zh"

# Fix font render in Mojave
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

# Change app language
defaults write com.apple.iCal AppleLanguages '("zh-TW")'
defaults write com.google.Chrome AppleLanguages '("zh-TW")'
defaults write com.skype.skype AppleLanguages '("zh-TW")'
defaults write com.microsoft.Excel AppleLanguages '("zh-TW")'
defaults write com.microsoft.Word AppleLanguages '("zh-TW")'
defaults write com.microsoft.Powerpoint AppleLanguages '("zh-TW")'
