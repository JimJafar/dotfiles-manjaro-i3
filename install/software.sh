#!/usr/bin/env bash

# zsh
sudo pacman -S zsh

# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# terminator
sudo pacman -S terminator

# atom
sudo pacman -S atom

# Skype
yaourt -S skypeforlinux-stable-bin

# meld
sudo pacman -S meld

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# Enable Ledger Nano S: http://support.ledgerwallet.com/knowledge_base/topics/ledger-wallet-is-not-recognized-on-linux
wget -q -O - https://www.ledgerwallet.com/support/add_udev_rules.sh | sudo bash

# zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# FontAwesome
sudo pacman -S ttf-font-awesome

# paper fonts
sudo pacman -S paper-icon-theme

# i3
sudo pacman -S i3blocks
sudo pacman -S compton
sudo pacman -S rofi
sudo pacman -S feh
sudo pacman -S arandr
sudo pacman -S lxappearance
