# Dotfiles
A backup of dotfiles and config files that i use in my setup 



# Installation
copy and paste into your termianl and it should setup everything.

```bash
# clone the repo 
git clone https://github.com/Donal-Breen-05/Dotfiles.git

# cd into the repo
cd Dotfiles/

# copy all folders to the .config directory
cp -r * ~/.config/

# remove foldeer
cd ..
rm -rf Dotfiles
```


## requirments 
```bash
# arch
sudo pacman -S kitty waybar sway wofi hyprlock

# debian / ubuntu
sudo apt install kitty waybar sway wofi hyprlock

# ferdora
sudo dnf install kitty waybar sway wofi hyprlock
```
use the relevant command to install all needed software on your system if you would like to use the dotfiles 
