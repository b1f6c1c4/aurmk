#!/bin/sh

set -eu

sudo pacman -Syu --noconfirm

if [ -n "${PARALLEL+x}" ]; then
    printf "\e[36m"
    echo "MAKEFLAGS=\"-j$PARALLEL\"" | sudo tee -a /etc/makepkg.conf
    printf "\e[0m"
fi

[ -f PKGBUILD ] && exec /usr/bin/makepkg -s --noconfirm "$@"

T="$(mktemp -d)"
O="$PWD"
sudo pacman -S git --noconfirm
git clone --depth=1 "https://aur.archlinux.org/$1.git" "$T"
sudo pacman -Rs git --noconfirm

(cd "$T" && /usr/bin/makepkg -s --noconfirm && mv ./*.pkg.tar.zst "$O")

rm -rf "$T"
