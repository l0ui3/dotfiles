#!/bin/bash

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

# Fix font render in Mojave (Don't use this in Catalina)
#defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
#defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

# Reset FontSmoothing
defaults -currentHost delete -globalDomain AppleFontSmoothing
defaults write -g CGFontRenderingFontSmoothingDisabled -bool True

# Show full bundle identifier of a package
# mdls -name kMDItemCFBundleIdentifier /Applications/Hyper.app

# Fix Hyper Terminal Font
defaults write co.zeit.hyper CGFontRenderingFontSmoothingDisabled 0
defaults write co.zeit.hyper.helper CGFontRenderingFontSmoothingDisabled 0
defaults write co.zeit.hyper.helper.EH CGFontRenderingFontSmoothingDisabled 0
defaults write co.zeit.hyper.helper.NP CGFontRenderingFontSmoothingDisabled 0

defaults write com.microsoft.VSCode CGFontRenderingFontSmoothingDisabled 0
defaults write com.microsoft.VSCode.helper CGFontRenderingFontSmoothingDisabled 0
defaults write com.microsoft.VSCode.helper.EH CGFontRenderingFontSmoothingDisabled 0
defaults write com.microsoft.VSCode.helper.NP CGFontRenderingFontSmoothingDisabled 0

defaults write com.apple.Notes CGFontRenderingFontSmoothingDisabled 0
defaults write com.apple.Notes CGFontRenderingFontSmoothingDisabled 0
defaults write com.apple.Notes CGFontRenderingFontSmoothingDisabled 0
defaults write com.apple.Notes CGFontRenderingFontSmoothingDisabled 0

defaults write com.sublimetext.3 CGFontRenderingFontSmoothingDisabled 0
defaults write com.sublimetext.3 CGFontRenderingFontSmoothingDisabled 0
defaults write com.sublimetext.3 CGFontRenderingFontSmoothingDisabled 0
defaults write com.sublimetext.3 CGFontRenderingFontSmoothingDisabled 0

defaults write com.spotify.client CGFontRenderingFontSmoothingDisabled 0
defaults write com.spotify.client CGFontRenderingFontSmoothingDisabled 0
defaults write com.spotify.client CGFontRenderingFontSmoothingDisabled 0
defaults write com.spotify.client CGFontRenderingFontSmoothingDisabled 0

defaults write com.apple.Terminal CGFontRenderingFontSmoothingDisabled 0
defaults write com.apple.Terminal CGFontRenderingFontSmoothingDisabled 0
defaults write com.apple.Terminal CGFontRenderingFontSmoothingDisabled 0
defaults write com.apple.Terminal CGFontRenderingFontSmoothingDisabled 0


# Change app language
defaults write com.apple.iCal AppleLanguages '("zh-TW")'
defaults write com.google.Chrome AppleLanguages '("zh-TW")'
defaults write com.skype.skype AppleLanguages '("zh-TW")'
defaults write com.microsoft.Excel AppleLanguages '("zh-TW")'
defaults write com.microsoft.Word AppleLanguages '("zh-TW")'
defaults write com.microsoft.Powerpoint AppleLanguages '("zh-TW")'
