# Niri Atomic &nbsp; [![build](https://github.com/boblangley/niri-atomic/actions/workflows/build.yml/badge.svg)](https://github.com/boblangley/niri-atomic/actions/workflows/build.yml)

A custom Fedora Atomic image featuring the [Niri](https://github.com/YaLTeR/niri) tiling window manager, along with a curated set of development tools and applications.

This image is built for personal use but is publicly available for anyone who finds the combination of tools useful.

## Features

- **Window Manager**: [Niri](https://github.com/YaLTeR/niri) - A scrollable-tiling Wayland compositor.
- **Development**:
    - Docker (Moby)
    - VSCode (layered)
- **Biometric Authentication**: [Howdy](https://github.com/boltgolt/howdy) for facial recognition.
- **Core Applications**:
    - Waybar
    - Fuzzel
    - Mako
    - Swaylock
    - Swayidle
- **Flatpaks**:
    - Vivaldi
    - Discord
    - Loupe
    - File Roller
    - Mission Center
- **Integrated Tools**:
    - [Homebrew](https://brew.sh/): Pre-installed for managing additional CLI packages.
    - [chezmoi](https://chezmoi.io/): Automatically configured to manage dotfiles from the companion [dotfiles repository](https://github.com/boblangley/dotfiles).
- **Fonts**:
    - [Nerd Fonts](https://www.nerdfonts.com/): FiraMono, Hack, and SourceCodePro are included for developer-focused icons and glyphs.
    - [Google Fonts](https://fonts.google.com/): Roboto and Open Sans are included for UI consistency.

## Installation

> [!WARNING]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/boblangley/niri-atomic:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/boblangley/niri-atomic:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If building on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/boblangley/niri-atomic
```