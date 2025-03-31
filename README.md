Sure! Here's the revised README with an additional line for optional applications:

---

# Hyprland

This repository provides a collection of dot config files for Hyprland, along with a simple install script for setting up a fresh Arch Linux system using `yay`. For optional applications, you can find additional recommendations under the "Other Apps" section. Flatpak

## Manual Installation

To grab the config files and install the required packages manually, you can use the following command:

```bash
yay -S hyprland-bin kitty zsh waybar-hyprland \
    swaybg swaylock-effects wofi wlogout mako thunar \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    polkit-gnome python-requests starship \
    swappy grim slurp pamixer brightnessctl gvfs \
    bluez bluez-utils lxappearance xfce4-settings \
    dracula-gtk-theme dracula-icons-git xdg-desktop-portal-hyprland-git \
    btop
```

To install additional apps, you can use:


## (Pacman and Flatpak) Apps

For other optional applications, you can install them using:

```bash
sudo pacman -S PACKETNAME 
```

```bash
flatpak install flathub PACKETNAME
```

Alternatively, you can use the attached script `set-hypr` to install everything automatically for you.

---
