#!/bin/sh

set -e

sudo apt update


# APT Packets
apt_packages="tmux ranger fzf neofetch kubectx"

for package in $apt_packages; do
	sudo apt install -y "$package"
done


# Snap Packets
snap_packages="bitwarden"

for package in $snap_packages; do
	sudo snap install "$package"
done


# Add custom bash config to ~/.bashrc
CUSTOM_BASHRC_LOCATION='. "$HOME/.bashrc_custom"'


if ! grep -Fxq "$CUSTOM_BASHRC_LOCATION" "$HOME/.bashrc"; then
	echo "$CUSTOM_BASHRC_LOCATION" >> "$HOME/.bashrc"
	echo "Adding .bashrc_custom to ~/.bashrc"
else
	echo "Nothing"
fi


printf "\n\nFinished setup!"
