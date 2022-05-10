#!/bin/bash

# This script will download and install all the packages and tools I need for my dev environment

cd $HOME

# update apt package list and upgrade all installed packages
sudo apt-get update -y
sudo apt-get upgrade -y

# install needed packages
sudo apt-get install git -y
sudo apt-get install build-essential -y
sudo apt-get install devscripts -y
sudo apt-get install snapd -y
sudo apt-get install aptitude -y
sudo snap install curl
sudo apt-get install wget -y
sudo apt-get install xclip -y
sudo apt-get install lxappearance -y

# install rustup (Rust) -- needed for LeftWM
sudo snap install rustup --classic
rustup install stable
rustup default stable

# install LeftWM dependencies
cd $HOME
sudo apt-get install xorg -y
sudo apt-get install libx11-dev -y
sudo apt-get install x11-xserver-utils -y
sudo apt-get install libxinerama-dev -y
sudo apt-get install xserver-xorg -y

# install LeftWM and my modified Epitaph theme for LeftWM
git clone https://github.com/leftwm/leftwm.git
cd leftwm
cargo build --release
sudo install -s -Dm755 ./target/release/leftwm ./target/release/leftwm-worker ./target/release/leftwm-state ./target/release/leftwm-check ./target/release/leftwm-command -t /usr/bin
sudo cp leftwm.desktop /usr/share/xsessions/

# install Picom -- Epitaph dependency
cd $HOME
git clone https://github.com/yshui/picom.git
sudo apt-get install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
cd $HOME/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# install Polybar -- Epitaph dependency
cd $HOME
sudo apt-get install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# install Epitaph dependencies
sudo apt-get install suckless-tools -y
sudo apt-get install pkg-config -y
sudo apt-get install libx11-dev -y
sudo apt-get install libasound2-dev -y
sudo apt-get install feh -y
sudo apt-get install pulseaudio -y
sudo apt-get install libnotify-bin -y
sudo apt-get install i3lock -y
sudo apt-get install inotify-tools -y
sudo apt-get install i3lock-fancy -y
sudo apt-get install lemonbar -y

# install OPTIONAL Epitaph dependencies -- provides best out of the box experience with Epitaph and LeftWM
sudo apt-get install thunar -y
sudo apt-get install xdg-user-dirs -y
sudo apt-get install mate-polkit -y
sudo apt-get install gnome-keyring seahorse -y
sudo apt-get install apparmor-notify -y
sudo apt-get install blueman -y
sudo apt-get install network-manager -y

# install my modified version of Epitaph
cd $HOME/.config/dotfiles/leftwm/themes/Epitaph
./epitaph --easy

# install SauceCodePro Nerd Font -- my font of choice for mainly my terminal and text editors
cd $HOME
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh SourceCodePro

# install Node Version Manager (NVM) -- only needed if you work with NodeJS
cd $HOME
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source $HOME/.profile
nvm --version
nvm install node

# install McFly -- OPTIONAL
mkdir $HOME/Repos
cd $HOME/Repos
git clone https://github.com/michaelnavs/mcfly.git
cd mcfly
cargo install --path .
cd $HOME

# install OPTIONAL packages
sudo snap install alacritty --classic                                    # terminal emulator
sudo aptitude install arandr -y                                          # display manager GUI
sudo snap install dbeaver-ce                                             # Database GUI for SQL DBs
sudo snap install discord                                                # Discord
sudo apt-get install gnome-tweaks -y                                     # gnome settings
sudo apt-get install neofetch -y                                         # TUI system information
sudo apt-get install obs-studio -y                                       # Obs (screen recorder and livestream)
sudo apt-get install postgresql postgresql-contrib -y                    # PostgreSQL DB
sudo snap install nvim --edge --classic                                  # Neovime Nightly Build
sudo apt-get install pavucontrol -y                                      # System Sound Settings
sudo snap install postman                                                # API Testing tool
sudo apt-get install ranger -y                                           # TUI file explorer
sudo snap install spotify                                                # Spotify music
sudo snap install starship                                               # Shell prompt
sudo snap install sublime-text --classic                                 # Text editor
sudo apt-get install tmux -y                                             # Terminal mulitplexer
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm    # Tmux package manager
sudo snap install vlc                                                    # Media player

# install Zsh shell, Oh-my-zsh, and Zsh-autosuggestions
sudo apt-get install zsh -y
chsh -s /bin/zsh
yes | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# create directories to store dotfiles in default location
mkdir $HOME/.local/bin/   # needed for applist

# copy my dotfiles to their needed location
cp $HOME/.config/dotfiles/.tmux.conf $HOME/
cp $HOME/.config/dotfiles/.zshrc $HOME/
cp $HOME/.config/dotfiles/applist $HOME/.local/bin/
cp $HOME/.config/dotfiles/starship.toml $HOME/.config/
cp $HOME/.config/dotfiles/alacritty/ $HOME/.config/ -r
cp $HOME/.config/dotfiles/nvim/ $HOME/.config/ -r
cp $HOME/.config/dotfiles/leftwm/ $HOME/.config/ -r
cp $HOME/.config/dotfiles/.themes/ $HOME/ -r
cp $HOME/.config/dotfiles/.icons/ $HOME/ -r

sudo apt autoremove

lxappearance # a GUI theme switcher, will pause the execution of this script

# In lxappearance GUI, under Widget select Bazik, under Icon Theme select Kora, under Mouse Cursor select whatever cursor you want

sudo reboot now # restarts your System

# After your system reboots, when you get to the part where you enter your password,
# click on the gear icon and select LeftWM. Now, eneter your password and enjoy my setup
