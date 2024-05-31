{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      systems = ["aarch64-linux" "x86_64-linux"];
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs systems (
          system: function nixpkgs.legacyPackages.${system}
        );
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./shell.nix { };
      });

      packages = forAllSystems (pkgs: rec {
        default = catppuccin-cursors;
        catppuccin-cursors= pkgs.callPackage ./default.nix { };
      });
    };
}
