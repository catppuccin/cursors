{
  pkgs ? import <nixpkgs> { },
}:
let
  mainPkg = pkgs.callPackage ./default.nix { };
in
mainPkg.overrideAttrs (oa: {
  nativeBuildInputs = [ ] ++ (oa.nativeBuildInputs or [ ]);
})