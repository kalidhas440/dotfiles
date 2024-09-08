#!/bin/bash
# Arch-based system

LOGFILE="install_log.txt"
FAILED_PACKAGES="failed_packages.txt"
PACKAGES=("kitty" "thunar" "thunar-volman" "thunar-archive-plugin" "vlc" "rhythmbox" "shotwell" "mpv" "gnome-disk-utility" "kdeconnect" "file-roller" "zathura" "zathura-pdf-poppler" "git" "base-devel" "zsh" "waybar" "wlogout" "mako" "wofi" "copyq" "bluez" "bluez-utils" "brightnessctl" "clang" "cmake" "dmidecode" "fzf" "zoxide" "starship" "gedit" "nano" "neovim" "htop" "cava" "bpytop" "gnome-keyring" "go" "man-db" "neofetch" "mariadb" "nethogs" "network-manager-applet" "nodejs" "npm" "ntfs-3g" "nwg-look" "nwg-drawer" "openssh" "polkit-gnome" "python-pip" "rustup" "slurp" "sshfs" "subversion" "unzip" "ttf-fonts-awesome" "ttf-nerd-fonts-symbols" "udisks2" "wget" "curl" "wl-clipboard" "wlroots" "xdg-desktop-portal-wlr")

echo "Listed Applications, utilities, and yay will be installed and config files will be set up automatically" | tee $LOGFILE

echo "Updating System First...." | tee -a $LOGFILE
sudo pacman -Syu --noconfirm 2>> $LOGFILE

echo "Installing Applications..." | tee -a $LOGFILE

# Install each package and log failures
for pkg in "${PACKAGES[@]}"; do
    if ! sudo pacman -S --noconfirm $pkg 2>> $LOGFILE; then
        echo "$pkg" >> $FAILED_PACKAGES
    fi
done

# Installing yay
cd .. || exit
echo "Cloning the yay repository..." | tee -a $LOGFILE
git clone https://aur.archlinux.org/yay.git 2>> $LOGFILE

# Build and install yay
echo "Building and installing yay..." | tee -a $LOGFILE
if ! (cd yay && makepkg -si --noconfirm 2>> $LOGFILE); then
    echo "Failed to build and install yay" >> $FAILED_PACKAGES
fi

cd .. || exit
rm -rf yay

echo "Yay has been installed successfully!" | tee -a $LOGFILE

echo "Updatin yay" | tee -a $LOGFILE
yay -Syu --noconfirm 2>$1 tee -a $LOGFILE


echo "Installing packages from yay" | tee -a $LOGFILE
YAY_PACKAGES=("brave-bin" "visual-studio-code-bin" "spotify" "telegram-desktop" "zed" "balena-etcher")

for pkg in "${YAY_PACKAGES[@]}"; do
    if ! yay -S --noconfirm $pkg 2>> $LOGFILE; then
        echo "$pkg" >> $FAILED_PACKAGES
    fi
done

echo "Setting up Configuration files" | tee -a $LOGFILE
cp -r ~/dotfiles/config/* ~/config 2>> $LOGFILE

echo "Setting up zsh" | tee -a $LOGFILE
cp ~/dotfiles/config/zshrc ~/.zshrc
mkdir -p ~/Pictures/Screenshots

echo "Finishing Up!"
sudo pacman -Syu --noconfirm 2>> $LOGFILE
yay -Syu --noconfirm 2>$1 tee -a $LOGFILE


echo "Installation and setup complete!" | tee -a $LOGFILE

# Display the packages that failed to install
if [[ -s $FAILED_PACKAGES ]]; then
    echo "The following packages failed to install:" | tee -a $LOGFILE
    cat $FAILED_PACKAGES | tee -a $LOGFILE
else
    echo "All packages were installed successfully!" | tee -a $LOGFILE
fi
