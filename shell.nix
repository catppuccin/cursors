{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "dev-shell";
  buildInputs = with pkgs; [
    just
    hyprcursor
    inkscape
    xcur2png
    xorg.xcursorgen
    zip
  ];
}

