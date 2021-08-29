#!/bin/sh

set -eu

sudo pacman -Syu --noconfirm

[ -f PKGBUILD ] && exec /usr/bin/makepkg -s --noconfirm "$@"

sudo pacman -S git --noconfirm
git clone --depth=1 "https://aur.archlinux.org/$1.git" /tmp
sudo pacman -Rs git --noconfirm

(cd /tmp && /usr/bin/makepkg -s --noconfirm)

cp /tmp/*.pkg.tar.zst .
