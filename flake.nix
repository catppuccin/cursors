{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllSystems =
        function: nixpkgs.lib.genAttrs systems (system: function nixpkgs.legacyPackages.${system});
    in
    {
      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);

      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./shell.nix { };
      });

      packages = forAllSystems (pkgs: rec {
        default = catppuccin-cursors;
        catppuccin-cursors = pkgs.callPackage ./default.nix { };
      });
    };
}
