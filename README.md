# aurmk: Dockerized AUR builder

> Run makepkg(8) in docker

## TL;DR

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

## Requirements

* It depends on docker. If you need `sudo` to run `docker`, prefix `aurmk` with `sudo`.
* `<dir>` shall have UID 1000.

## Usage

```
aurmk: Dockerized AUR builder

Usage: aurmk [-h|--help] [-j <parallel>] [-C <chdir>]
             [<pkgname>] [<makepkg.8-options>...]

       Build an AUR package into <chdir>.
       Packages in <chdir>/prep/ will be installed before building.

Note: If <chdir>/PKGBUILD exists, <pkgname> must not be supplied.
      If <chdir>/PKGBUILD doesn't exist, <pkgname> must be supplied.
```

## License

MIT
