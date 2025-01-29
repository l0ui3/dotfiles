#!/bin/bash


sudo apt update -y
sudo apt upgrade -y
sudo apt install curl vim

# Chinese IME
sudo apt purge fxitx*
sudo apt install fcitx5 fcitx5-chinese-addons fcitx5-chewing

im-config
# choose fxitx5


