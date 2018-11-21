#!/bin/bash
# bash_aliases

# List aliases
alias l="ls"
alias ll="ls -Galh"

# Direcotry shortcut
alias pj="cd ~/Projects"
alias ic="cd ~/iCloud"

# Make grep with color
alias grep="grep --color=auto"

# Remove .DS_Store in current directory
alias rm_dsstore="find ./ -name .DS_Store -print0 | xargs -0 rm"

# Networking
alias ports="lsof -PiTCP -sTCP:LISTEN"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
