#!/bin/bash

# Setup .bash prompt and aliases
cp dot_bash_profile ~/.bash_profile
cp dot_bash_prompt ~/.bash_prompt
cp dot_bash_aliases ~/.bash_aliases

# Vim config
cp dot_vimrc ~/.vimrc

# SSH config
cp dot_ssh_config ~/.ssh/config

# Install Homebrew (Interactive)
if [[ ! -e /usr/local/Homebrew ]]; then
	echo -e "[*] Homebrew is not installed, install now."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages by brew bundle
brew bundle

# Change app language
defaults write com.apple.iCal AppleLanguages '("zh-TW")'
defaults write com.google.Chrome AppleLanguages '("zh-TW")'
defaults write com.skype.skype AppleLanguages '("zh-TW")'
defaults write com.microsoft.Excel AppleLanguages '("zh-TW")'
defaults write com.microsoft.Word AppleLanguages '("zh-TW")'
defaults write com.microsoft.Powerpoint AppleLanguages '("zh-TW")'