{
  description = "Me";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          name = "Me";
          nativeBuildInputs = with pkgs; [
            gnumake
            typst
          ];

          # Let typst find the fonts vendored under cv/fonts during interactive use
          # (e.g. `typst watch`), matching what the Makefile passes via --font-path.
          shellHook = ''
            export TYPST_FONT_PATHS="$(pwd)/cv/fonts''${TYPST_FONT_PATHS:+:$TYPST_FONT_PATHS}"
          '';
        };
      }
    );
}
