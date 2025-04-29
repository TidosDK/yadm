#!/bin/sh

set -e

# Detect package manager
if command -v nala &>/dev/null; then
    PACKAGE_MANAGER="nala"
    INSTALL_CMD="sudo nala install -y"
elif command -v apt-get &>/dev/null; then
    PACKAGE_MANAGER="apt-get"
    INSTALL_CMD="sudo apt-get install -y"
elif command -v pacman &>/dev/null; then
    PACKAGE_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --noconfirm"
else
    echo "Unsupported package manager. Please use a system with APT or Pacman."
    exit 1
fi

# Ensure necessary tools are installed
$INSTALL_CMD jq curl

# Directory where Discord is installed
DISCORD_DIR="/usr/share/discord"

# Temporary directory for downloading the latest package
DISCORD_LAUNCHER_DIR="/home/matty/.discord/"

# Backup the original Discord launcher and create symlink
if [ -f "$DISCORD_DIR/Discord" ]; then
    sudo mv "$DISCORD_DIR/Discord" "$DISCORD_DIR/Discord.orig"
    sudo ln -s $DISCORD_LAUNCHER_DIR/discord-launcher.sh "$DISCORD_DIR/Discord"
    echo "Setup complete. Discord will now be updated automatically when launched."
else
    echo "Discord installation not found in $DISCORD_DIR. Please ensure Discord is installed."
    exit 1
fi
