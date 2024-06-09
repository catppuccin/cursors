<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin for <a href="https://github.com/varlesh/volantes-cursors">Cursors</a>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>
<p align="center">
    <a href="https://github.com/catppuccin/cursors/stargazers"><img alt="Stargazers" src="https://img.shields.io/github/stars/catppuccin/cursors?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/cursors/issues"><img src="https://img.shields.io/github/issues/catppuccin/cursors?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/cursors/contributors"><img src="https://img.shields.io/github/contributors/catppuccin/cursors?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/cursors/main/assets/cat-cursors.png"/>
</p>

## Previews

<details>
<summary>🌻 Latte</summary>
  <img src="https://raw.githubusercontent.com/catppuccin/cursors/main/assets/cursors-latte.png"/>
</details>
<details>
<summary>🪴 Frappé</summary>
  <img src="https://raw.githubusercontent.com/catppuccin/cursors/main/assets/cursors-frappe.png"/>
</details>
<details>
<summary>🌺 Macchiato</summary>
  <img src="https://raw.githubusercontent.com/catppuccin/cursors/main/assets/cursors-macchiato.png"/>
</details>
<details>
<summary>🌿 Mocha</summary>
  <img src="https://raw.githubusercontent.com/catppuccin/cursors/main/assets/cursors-mocha.png"/>
</details>

## Acknowledgement

This project is a modification of [Volantes Cursors](https://github.com/varlesh/volantes-cursors).

## Installation

### GitHub Release

<!-- x-release-please-start-version -->

1. Download your preferred flavor and accent from the [latest GitHub release](https://github.com/catppuccin/cursors/releases/tag/v0.4.0).

1. Extract the downloaded zip to one of the following locations:

   - **For the local user:** `$HOME/.icons`
   - **For all users**: `/usr/share/icons`

1. Choose the theme in your settings.

#### Example Installation

```bash
cd $HOME/.icons # or `/usr/share/icons`
curl -LOsS https://github.com/catppuccin/cursors/releases/download/v0.4.0/catppuccin-frappe-blue-cursors.zip
unzip catppuccin-frappe-blue-cursors.zip
```

<!-- x-release-please-end -->

### Arch Linux

Individual flavor packages are available to download with your preferred AUR helper:

```bash
yay -S catppuccin-cursors-latte
yay -S catppuccin-cursors-frappe
yay -S catppuccin-cursors-macchiato
yay -S catppuccin-cursors-mocha
```

A `-git` package is also available which builds the cursors from source. This
package contains all variants of flavor and accent.

```bash
yay -S catppuccin-cursors-git
```

### NixOS

Nixpkgs has
[catppuccin-cursors](https://github.com/NixOS/nixpkgs/tree/nixos-23.11/pkgs/data/icons/catppuccin-cursors).
Use it by providing your preferred flavor + accent in camelCase. E.g.

```nix
pkgs.catppuccin-cursors.mochaMauve
```

## Manual Installation

### Requirements

- [xcursorgen](https://wiki.archlinux.org/title/Xcursorgen) to generate the
  cursors.
- [inkscape](https://wiki.inkscape.org/wiki/Inkscape) to convert SVGs to PNGs.
- **(Optional)** [hyprcursor](https://github.com/hyprwm/hyprcursor) to include
  hyprcursor variants.
- **(Optional)** [just](https://github.com/casey/just) to easily run development
  commands.

### Steps

1. Clone this repository and go to downloaded directory:

   ```bash
   git clone https://github.com/catppuccin/cursors.git
   cd cursors
   ```

1. Run the following command(s) if you have just installed, if not then look
   inside the [justfile](./justfile) to understand what commands are being run. 

   ```bash
   just all # Build all flavor-accent variants.
   just all_with_hyprcursor # Build all flavor-accent variants with hyprcursor support
   just build mocha # To build all variants under one single flavor.
   just build_with_hyprcursor mocha # To build all variants under one single flavor with hyprcursor support
   just build mocha blue # To build only the blue variant under mocha.
   just build mocha 'blue mauve peach' # To build only the blue, mauve, and peach variants under mocha.
   ```

1. Extract built cursors in `./dist` to `$HOME/.icons` or `/usr/share/icons`.

## 💝 Thanks to

- [varlesh](https://github.com/varlesh/volantes-cursors)
- [elkrien](https://github.com/elkrien)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/cursors/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=GNU&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>
