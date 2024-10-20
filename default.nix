{
  lib,
  stdenvNoCC,
  inkscape,
  just,
  xcursorgen,
  xcur2png,
  hyprcursor,
  zip,
  catppuccin-whiskers,
  python3,
  python3Packages,
}:
stdenvNoCC.mkDerivation {
  name = "catppuccin-cursors";
  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.intersection (lib.fileset.fromSource (lib.sources.cleanSource ./.)) (
      lib.fileset.unions [
        ./src
        ./scripts
        ./justfile
        ./build
        ./AUTHORS
        ./LICENSE
      ]
    );
  };

  nativeBuildInputs = [
    just
    xcursorgen
    xcur2png
    inkscape
    hyprcursor
    zip
    catppuccin-whiskers
    python3
    python3Packages.pyside6
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
