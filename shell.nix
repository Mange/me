{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  name = "me";

  nativeBuildInputs = with pkgs; [
    gnumake
    typst
  ];

  # Let typst find the fonts vendored under cv/fonts during interactive use
  # (e.g. `typst watch`), matching what the Makefile passes via --font-path.
  shellHook = ''
    export TYPST_FONT_PATHS="${builtins.toString ./cv/fonts}''${TYPST_FONT_PATHS:+:$TYPST_FONT_PATHS}"
  '';
}
