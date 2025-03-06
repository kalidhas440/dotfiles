!/bin/bash
# Arch-based system

LOGFILE="install_log.txt"
FAILED_PACKAGES="failed_packages.txt"
PACKAGES=("stow" "sway" "swaybg" "hyprland" "tmux" "llvm" "hyprlock" "hypridle" "kitty" "filelight" "thunar" "thunar-archive-plugin" "thunar-vcs-plugin thunar-volman"  "vlc" "rhythmbox" "tree" "shotwell" "flameshot" "mpv" "gnome-disk-utility" "kdeconnect" "file-roller" "evince" "git" "base-devel" "zsh" "waybar" "swaync" "wofi" "wofi-emoji" "copyq" "bluez" "bluez-utils" "brightnessctl" "clang" "cmake" "dmidecode" "fzf" "zoxide" "starship" "gedit" "nano" "neovim" "htop" "bpytop" "gnome-keyring" "go" "man-db" "neofetch" "mariadb" "nethogs" "networkmanager" "network-manager-applet" "nodejs" "npm" "ntfs-3g" nwg-look" "nwg-displays "openssh" "polkit-gnome" "python-pip" "rustup" "slurp" "sshfs" "subversion" "unzip" "ttf-fonts-awesome" "ttf-nerd-fonts-symbols" "ttf-jetbrains-mono" "ttf-jetbrains-mono-nerd" "cmus" "udisks2" "wget" "curl" "wl-clipboard" "wlroots" "xdg-desktop-portal-wlr" "elisa" "papirus-icon-theme" "gnome-calculator" "noto-font-emoji" "man-db" "gdb" "cheese" "obsidian" "pavucontrol" "proton-vpn-gtk-app" "gparted" )

echo "Listed Applications, utilities, and yay will be installed and config files will be set up automatically" | tee $LOGFILE

echo "Updating System First...." | tee -a $LOGFILE
sudo pacman -Syu --noconfirm 2>>$LOGFILE

echo "Installing Applications..." | tee -a $LOGFILE

# Install each package and log failures
for pkg in "${PACKAGES[@]}"; do
  if ! sudo pacman -S --noconfirm $pkg 2>>$LOGFILE; then
    echo "$pkg" >>$FAILED_PACKAGES
  fi
done

# Installing yay
cd .. || exit
echo "Cloning the yay repository..." | tee -a $LOGFILE
git clone https://aur.archlinux.org/yay.git 2>>$LOGFILE

# Build and install yay
echo "Building and installing yay..." | tee -a $LOGFILE
if ! (cd yay && makepkg -si --noconfirm 2>>$LOGFILE); then
  echo "Failed to build and install yay" >>$FAILED_PACKAGES
fi

cd .. || exit
rm -rf yay

echo "Yay has been installed successfully!" | tee -a $LOGFILE

echo "Updatin yay" | tee -a $LOGFILE
yay -Syu --noconfirm tee -a $LOGFILE 2>$

echo "Installing packages from yay" | tee -a $LOGFILE
YAY_PACKAGES=("brave-bin" "visual-studio-code-bin" "spotify" "telegram-desktop" "wlogout" "cava" "waypaper" "zed" "ags-hyprland-git" "ani-cli" "pipes.sh" )

for pkg in "${YAY_PACKAGES[@]}"; do
  if ! yay -S --noconfirm $pkg 2>>$LOGFILE; then
    echo "$pkg" >>$FAILED_PACKAGES
  fi
done

git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

echo "Finishing Up!"
sudo pacman -Syu --noconfirm 2>>$LOGFILE
yay -Syu --noconfirm tee -a $LOGFILE 2>$1

echo "Installation and setup complete!" | tee -a $LOGFILE

# Display the packages that failed to install
if [[ -s $FAILED_PACKAGES ]]; then
  echo "The following packages failed to install:" | tee -a $LOGFILE
  cat $FAILED_PACKAGES | tee -a $LOGFILE
else
  echo "All packages were installed successfully!" | tee -a $LOGFILE
fi
