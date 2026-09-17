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
            # CV and stuff
            gnumake
            typst

            # Website
            nodejs_26
            pnpm
            biome
          ];

          # Let typst find the fonts vendored under cv/fonts during interactive use
          # (e.g. `typst watch`), matching what the Makefile passes via --font-path.
          #
          # Biome also tries to use a precompiled binary in the node_module,
          # but this will not work on NixOS. Override it with the one we
          # installed from nixpkgs instead.
          shellHook = ''
            export TYPST_FONT_PATHS="$(pwd)/cv/fonts''${TYPST_FONT_PATHS:+:$TYPST_FONT_PATHS}"
            export BIOME_BINARY="${pkgs.biome}/bin/biome"
          '';
        };
      }
    );
}
