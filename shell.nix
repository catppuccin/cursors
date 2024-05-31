{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "dev-shell";
  buildInputs = with pkgs; [
    just
    hyprcursor
    inkscape
    xorg.xcursorgen
    zip
  ];
}

