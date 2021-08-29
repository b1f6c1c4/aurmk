#!/bin/sh

set -eu

sudo pacman -Syu --noconfirm

printf "\e[36m"
echo "MAKEFLAGS=\"-j$PARALLEL\"" | sudo tee -a /etc/makepkg.conf
printf "\e[0m"

[ -f PKGBUILD ] && exec /usr/bin/makepkg -s --noconfirm "$@"

sudo pacman -S git --noconfirm
git clone --depth=1 "https://aur.archlinux.org/$1.git" /tmp
sudo pacman -Rs git --noconfirm

(cd /tmp && /usr/bin/makepkg -s --noconfirm)

cp /tmp/*.pkg.tar.zst .
