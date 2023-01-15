<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin for <a href="https://github.com/catppuccin/cursors">Cursors</a>
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

## Info

This project is a modification of [Volantes Cursors](https://github.com/varlesh/volantes-cursors) with the Catppuccin palettes.

## Cursor sizes (pixels): 

<kbd>24</kbd>
<kbd>32</kbd>
<kbd>48</kbd>
<kbd>64</kbd>

## Usage

1. Clone this repository and go to downloaded directory:
    ```
    git clone https://github.com/catppuccin/cursors.git
    cd cursors
   ```
2. Extract selected theme from `cursors` directory:
    - for local user to: `~/.icons`
    - for all users to: `/usr/share/icons/`
      
&nbsp;
3. Choose theme in the Settings

### For Arch Linux users 

- We have 4 individual packages which download GitHub release zips. Install them with you favourite AUR helper:

  ```
  yay -S catppuccin-cursors-mocha catppuccin-cursors-macchiato catppuccin-cursors-frappe catppuccin-cursors-latte
  ```

- There also exists a `-git` package which builds the cursors from source. This package builds the cursors for all 4 variants and can take a lot of time to build depending on your system.

  ```
  yay -S catppuccin-cursors-git
  ```

### For Nix users
- nixpkgs has a single nix package which downloads the GitHub release zips.
- Use it by providing your preferred flavour + accent with the first letter in capital. Example:
```nix
pkgs.catppuccin-cursors.macchiatoPink
```
- It stores the cursor pack in `$out/share/icons/Catppuccin-<flavor>-<accent>-Cursors`, with the first letters of the flavor and accent in captial.

## Manual build from scratch

1. Clone this repository and go to downloaded directory:
    ```
    git clone https://github.com/catppuccin/cursors.git
    cd cursors
   ```
2. Make sure You have all dependencies installed:
    - git
    - make
    - inkscape
    - xcursorgen

3. Run the following commands (be aware that building takes a lot of time):
    ```
    make build
    sudo make install
    ```
4. Choose a theme in the Settings


## 💝 Thanks to

- [varlesh](https://github.com/varlesh/volantes-cursors)
- [elkrien](https://github.com/elkrien)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/cursors/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=GNU&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>

