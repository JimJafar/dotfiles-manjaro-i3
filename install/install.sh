#!/usr/bin/env bash

sh ~/dotfiles-manjaro-i3/install/software.sh

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "- STARTING CONFIG SETUP                                       -"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"

echo "ssh config"

if [ -f ~/.ssh/config ]; then
  mv ~/.ssh/config ~/.ssh/config-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/ssh/config ~/.ssh/config

echo "git config"

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.gitconfig ~/.gitconfig


echo "global .gitignore"

if [ -f ~/.gitignore_global]; then
  mv ~/.gitignore_global ~/.gitignore_global-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.gitignore_global ~/.gitignore_global

echo "zshrc"

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.zshrc ~/.zshrc
sudo ln -fs /home/jim/dotfiles-manjaro-i3/config/.zshrc /root/.zshrc

echo "dconf"

if [ -d ~/.config/dconf/user.d ]; then
  mv ~/.config/dconf/user.d ~/.config/dconf/user.d-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/dconf/user.d ~/.config/dconf

echo "ssh-agent"

if [ ! -d ~/.config/systemd/user ]; then
  mkdir -p ~/.config/systemd/user
fi

if [ -f ~/.config/systemd/user/ssh-agent.service ]; then
  mv ~/.config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
systemctl --user enable ssh-agent.service

echo "motd"

if [ -d ~/.motd.d ]; then
  if [ ! -L ~/.motd.d ]; then
    mv ~/.motd.d ~/.motd.d-pre-dotfiles-bak
  else
    rm ~/.motd.d
  fi
fi
ln -fs ~/dotfiles-manjaro-i3/config/.motd.d ~/

echo "file templates"

sh ~/dotfiles-manjaro-i3/install/templates.sh

echo "termite"

if [ ! -d ~/.config/termite ]; then
  mkdir ~/.config/termite
fi
if [ -f ~/.config/termite/config ]; then
  mv ~/.config/termite/config ~/.config/termite/config.pre-dotfiles-bak
fi

echo "terminator"

if [ ! -d ~/.config/terminator ]; then
  mkdir ~/.config/terminator
fi
if [ -f ~/.config/terminator/config ]; then
  mv ~/.config/terminator/config ~/.config/terminator/config.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/terminator/config ~/.config/terminator/config

echo "rofi themes"

if [ ! -d ~/.config/rofi ]; then
  mkdir ~/.config/rofi
fi

echo "nano"

if [ ! -d ~/.config/nano ]; then
  mkdir ~/.config/nano
fi
if [ -f ~/.config/nano/nanorc ]; then
  mv ~/.config/nano/nanorc ~/.config/nano/nanorc.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/nano/nanorc ~/.config/nano/nanorc

echo "Dunst (notifications)"

if [ ! -d ~/.config/dunst ]; then
  mkdir ~/.config/dunst
fi
if [ -f ~/.config/dunst/dunstrc ]; then
  mv ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.pre-dotfiles-bak
fi

echo "Clipit"

if [ ! -d ~/.config/clipit ]; then
  mkdir ~/.config/clipit
fi
if [ -f ~/.config/clipit/clipitrc ]; then
  mv ~/.config/clipit/clipitrc ~/.config/clipit/clipitrc.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/clipitrc ~/.config/clipit/clipitrc

echo "Ranger"

if [ ! -d ~/.config/ranger ]; then
  mkdir ~/.config/ranger
fi

if [ ! -d ~/.config/ranger/colorschemes ]; then
  mkdir ~/.config/ranger/colorschemes
fi

if [ -f ~/.config/ranger/rc.conf ]; then
  mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.pre-dotfiles-bak
fi

if [ -f ~/.config/ranger/rifle.conf ]; then
  mv ~/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf.pre-dotfiles-bak
fi

if [ -f ~/.config/ranger/scope.sh ]; then
  mv ~/.config/ranger/scope.sh ~/.config/ranger/scope.sh.pre-dotfiles-bak
fi

if [ ! -f ~/.config/ranger/colorschemes/darkest_space.py ]; then
  ln -fs ~/dotfiles-manjaro-i3/config/ranger/colorschemes/darkest_space.py ~/.config/ranger/colorschemes/darkest_space.py
fi
ln -fs ~/dotfiles-manjaro-i3/config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -fs ~/dotfiles-manjaro-i3/config/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -fs ~/dotfiles-manjaro-i3/config/ranger/scope.sh ~/.config/ranger/scope.sh

echo "i3"

if [ ! -d ~/.config/i3 ]; then
  mkdir ~/.config/i3
fi

if [ -f ~/.config/i3/config ]; then
  mv ~/.config/i3/config ~/.config/i3/config.pre-dotfiles-bak
fi

echo "i3 blocks"

if [ -f ~/.config/i3/i3blocks.conf ]; then
  mv ~/.config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/i3/i3blocks.conf ~/.config/i3

echo "i3 status"

if [ -f ~/.i3status.conf ]; then
  mv ~/.i3status.conf ~/.i3status.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/i3/i3status.conf ~/.i3status.conf

echo "gtk"

if [ -f ~/.gtkrc-2.0.mine ]; then
  mv ~/.gtkrc-2.0.mine ~/.gtkrc-2.0.mine.pre-dotfiles-bak
fi

if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  mv ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.pre-dotfiles-bak
fi
if [ -f ~/.config/gtk-3.0/gtk.css ]; then
  mv ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/

echo "screen layouts"

if [ -d ~/.screenlayout ]; then
  mv ~/.screenlayout ~/.screenlayout.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/screenlayout ~/.screenlayout

echo "compton"

if [ -f ~/.compton.conf ]; then
  mv ~/.compton.conf ~/.compton.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.compton.conf ~/.config/compton.conf

echo "OneDrive"

if [ ! -d ~/.config/onedrive ]; then
  mkdir ~/.config/onedrive
fi
if [ -f ~/.config/onedrive/sync_list ]; then
  mv ~/.config/onedrive/sync_list ~/.config/onedrive/sync_list.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/onedrive/sync_list ~/.config/onedrive/sync_list

echo ".xprofile"

if [ -f ~/.xprofile ]; then
  mv ~/.xprofile ~/.xprofile.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.xprofile ~/.xprofile

echo ".xinitrc"

if [ -f ~/.xinitrc ]; then
  mv ~/.xinitrc ~/.xinitrc.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.xinitrc ~/.xinitrc

echo "X settings"

if [ -f ~/.Xresources ]; then
  mv ~/.Xresources ~/.Xresources.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.Xresources ~/.Xresources

echo "redshift"

if [ -f ~/.config/redshift.conf ]; then
  mv ~/.config/redshift.conf ~/.config/redshift.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/redshift.conf ~/.config/redshift.conf

echo "MIME apps"

if [ -f ~/.config/mimeapps.list ]; then
  mv ~/.config/mimeapps.list ~/.config/mimeapps.list-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/mimeapps.list ~/.config/mimeapps.list

echo "/etc/default/grub"

if [ -f /etc/default/grub ]; then
  sudo mv /etc/default/grub /etc/default/grub.pre-dotfiles-bak
fi
sudo ln -fs ~/dotfiles-manjaro-i3/config/etc/default/grub /etc/default/grub

echo "nitrogen (wallpaper)"

if [ -d ~/.config/nitrogen ]; then
  mv ~/.config/nitrogen ~/.config/nitrogen.pre-dotfiles-bak
else
  mkdir ~/.config/nitrogen
fi
ln -fs ~/dotfiles-manjaro-i3/config/nitrogen/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg
ln -fs ~/dotfiles-manjaro-i3/config/nitrogen/nitrogen.cfg ~/.config/nitrogen/nitrogen.cfg

echo "simlink DropBox images to /Pictures"
ln -fs ~/Dropbox/images/ ~/Pictures/Dropbox

echo "changing default shell to zsh"
sudo chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh jim

echo "setting up trackpad"
sh ~/dotfiles-manjaro-i3/scripts/trackpad-setup.sh

echo "setting compose key to right-alt"
setxkbmap -option compose:ralt

echo "executable scripts"
sudo ln -fs ~/dotfiles-manjaro-i3/scripts/mx /usr/local/bin/mx

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "- FINISHED CONFIG SETUP                                       -"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
