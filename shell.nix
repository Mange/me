{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
  name = "me";

  nativeBuildInputs = with pkgs; [
    gnumake

    texinfoInteractive
    texliveFull
  ];
}
