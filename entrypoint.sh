#!/bin/sh

set -eu

if [ "${PARALLEL-auto}" = auto ]; then
    PARALLEL="$(grep -c ^processor /proc/cpuinfo)"
fi
if [ -n "$PARALLEL" ]; then
    printf "\e[36m"
    echo "MAKEFLAGS=\"-j$PARALLEL\"" | sudo tee -a /etc/makepkg.conf
    printf "\e[0m"
fi

sudo pacman -Syu --noconfirm

set -x
printf "\e[36m" >&2
sudo pacman -U --noconfirm prep/*.pkg.tar.zst || true
printf "\e[0m" >&2
set +x

[ -f PKGBUILD ] && exec /usr/bin/makepkg -s --noconfirm "$@"

T="$(mktemp -d)"
O="$PWD"
sudo pacman -S git --noconfirm
git clone --depth=1 "https://aur.archlinux.org/$1.git" "$T"
sudo pacman -Rsu git --noconfirm

(cd "$T" && /usr/bin/makepkg -s --noconfirm && mv ./*.pkg.tar.zst "$O")

rm -rf "$T"
