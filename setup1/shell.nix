# shell.nix
{ pkgs ? import <nixpkgs> { } }:

let python =
    let
    packageOverrides = self:
    super: {
      opencv4 = super.opencv4.override {
        enableGtk2 = true;
        gtk2 = pkgs.gtk2;
        #enableFfmpeg = true; #here is how to add ffmpeg and other compilation flags
        #ffmpeg_3 = pkgs.ffmpeg-full;
        };
    };
    in
      pkgs.python3.override {inherit packageOverrides; self = python;};
in
pkgs.mkShell {
  buildInputs = [
    (python.withPackages(ps: with ps; [
      opencv4
    ]))
    # other packages
  ];
}

# let
#   my-python-packages = ps: with ps; [
#     pandas
#     requests
#     # other python packages
#   ];
#   my-python = pkgs.python3.withPackages my-python-packages;
# in pkgs.mkShell {
#   buildInputs = [
#     my-python
#     # other packages
#   ];
#   shellHook = ''
#     # ...
#   '';
#   # nativeBuildInputs is usually what you want -- tools you need to run
#   nativeBuildInputs = with pkgs.buildPackages; [
#     # ...
#   ];
# }
# with pkgs;
# mkShell {
#   buildInputs = [
#     nixpkgs-fmt
#     python3
#     poetry
#   ];

#   shellHook = ''
#     # ...
#   '';
#   # nativeBuildInputs is usually what you want -- tools you need to run
#   nativeBuildInputs = with pkgs.buildPackages; [
#     # ...
#   ];
# }
