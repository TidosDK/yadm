#!/bin/sh

set -e

if [ $(/usr/bin/id -u) -ne 0 ]; then
	echo "This file must be run as root"
	exit
fi

apt update

declare -a apt_packages=("tmux" "ranger" "fzf" "neofetch" "kubectx")

for package in "${apt_packages[@]}"
do
	apt install "$package" -y
done

declare -a snap_packages=("bitwarden")

for package in "${snap_packages[@]}"
do
	snap install "$package"
done


echo "Done!"
