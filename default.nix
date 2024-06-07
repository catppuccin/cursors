{ lib
, stdenvNoCC
, inkscape
, just
, xcursorgen
  xcur2png
, hyprcursor
, zip
}:

stdenvNoCC.mkDerivation {
  name = "catppuccin-cursors";
  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.intersection
    (lib.fileset.fromSource (lib.sources.cleanSource ./.))
    (lib.fileset.unions [ ./src ./justfile ./build ./create_zips ./AUTHORS ./LICENSE ]);
  };
  nativeBuildInputs = [
    just
    xcursorgen
    xcur2png
    inkscape
    hyprcursor
    zip
  ];
  buildPhase = ''
    runHook preBuild

    patchShebangs .
    just all_with_hyprcursor
    just zip

    runHook postBuild
  '';
  installPhase = ''
    # $out is an automatically generated filepath by nix,
    # but it's up to you to make it what you need. We'll create a directory at
    # that filepath, then copy our sources into it.
    mkdir $out
    cp -rv ./releases/* $out
  '';
  meta = {
    description = "Catppuccin cursor theme based on Volantes";
    homepage = "https://github.com/catppuccin/cursors";
    license = lib.licenses.gpl2;
  };
}
