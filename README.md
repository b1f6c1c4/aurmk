# aurmk: dockerized AUR builder

> Run makepkg(8) in docker

1. Just build an AUR package:

    ```bash
    aurmk <pkgname>
    sudo pacman -U <pkgname>-*.pkg.tar.zst
    ```

1. Build an AUR package into another directory:

    ```bash
    aurmk -C <dir> <pkgname>
    sudo pacman -U <dir>/<pkgname>-*.pkg.tar.zst
    ```

1. Run `makepkg(8)` safely and directly:

    ```bash
    git clone <repo> <dir>
    aurmk -C <dir> [<makepkg.8-options>...]
    sudo pacman -U <dir>/<pkgname>-*.pkg.tar.zst
    ```

