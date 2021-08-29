# AUR Containerized Builder

> A clean way to run makepkg(8)

## The easy way

```bash
docker run --rm -v .:/home/builder b1f6c1c4/aur-cont-builder <pkgname>
sudo pacman -U <pkgname>/<pkgname>-<pkgver>-<pkgrel>-<arch>.pkg.tar.zst
```

## The traditional way

```bash
git clone https://aur.archlinux.org/<pkgname>.git
docker run --rm -v <pkgname>:/home/builder b1f6c1c4/aur-cont-builder
sudo pacman -U <pkgname>/<pkgname>-<pkgver>-<pkgrel>-<arch>.pkg.tar.zst
```
