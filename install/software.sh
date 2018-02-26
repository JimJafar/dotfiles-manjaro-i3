#!/usr/bin/env bash

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "- STARTING SOFTWARE INSTALLATION                              -"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"

echo "pulseaudio"
install_pulseaudio
sudo pacman -S pulseaudio-bluetooth

echo "Thunar"
sudo pacman -S --noconfirm thunar

echo "powerline fonts"
sudo pacman -S --noconfirm powerline-fonts

echo "zsh"
sudo pacman -S --noconfirm zsh

echo "postgres"
sudo pacman -S --noconfirm postgresql

echo "Oh My Zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "ruby"
sudo pacman -S --noconfirm ruby

echo "python & pip"
sudo pacman -S --noconfirm python
sudo pacman -S --noconfirm python-pip

echo "i3ipc"
gem install i3ipc

echo "terminator"
sudo pacman -S --noconfirm terminator

echo "Google chrome"
yaourt -S --noconfirm google-chrome

echo "Firefox"
sudo pacman -S --noconfirm firefox

#echo "mailspring"
#yaourt -S --noconfirm mailspring

echo "geary"
sudo pacman -S --noconfirm geary

echo "Franz"
yaourt -S --noconfirm franz

echo "atom"
sudo pacman -S --noconfirm atom

echo "IntelliJ IDEA"
yaourt -S --noconfirm intellij-idea-ultimate-edition

echo "Spotify"
yaourt -S --noconfirm spotify

echo "Dropbox"
yaourt -S --noconfirm dropbox

echo "Skype"
yaourt -S --noconfirm skypeforlinux-stable-bin

echo "meld"
sudo pacman -S --noconfirm meld

echo "Gpick color picker"
sudo pacman -S --noconfirm gpick

echo "Gnome calculator"
yaourt -S --noconfirm gnome-calculator

echo "nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

echo "Enable Ledger Nano S: http://support.ledgerwallet.com/knowledge_base/topics/ledger-wallet-is-not-recognized-on-linux"
wget -q -O - https://www.ledgerwallet.com/support/add_udev_rules.sh | sudo bash

echo "zsh stuff"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

echo "FontAwesome"
# sudo pacman -S --noconfirm ttf-font-awesome
echo "Use fontawesome 4 so spaces around fonts don't render as glyphs"
yaourt -S --noconfirm otf-font-awesome-4

echo "paper fonts"
sudo pacman -S --noconfirm paper-icon-theme

echo "shutter"
yaourt -S --noconfirm shutter

echo "i3 stuff"
sudo pacman -S --noconfirm i3blocks
sudo pacman -S --noconfirm compton
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm arandr
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm xorg-xbacklight

echo "pavucontrol"
sudo pacman -S --noconfirm pavucontrol

echo "playerctl"
sudo pacman -S --noconfirm playerctl

echo "postgres"
sudo pacman -S --noconfirm postgresql

echo "docker"
yaourt -S --noconfirm docker-git

echo "Libre Office"
sudo pacman -S --noconfirm libreoffice-fresh

echo "removing palemoon"
sudo pacman -Rs palemoon-bin

echo "To complete postgres setup:"
echo "sudo -u postgres -i"
echo "initdb --locale \$LANG -E UTF8 -D '/var/lib/postgres/data'"
echo "exit"
echo "systemctl start postgresql.service"
echo "systemctl enable postgresql.service"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"

echo "To enable Bluetooth speakers, add the following to /etc/bluetooth/audio.conf under [General]"
echo "Enable=Source,Sink,Media,Socket"
echo "https://wiki.archlinux.org/index.php/bluetooth#Audio"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "- FINISHED SOFTWARE INSTALLATION                              -"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
