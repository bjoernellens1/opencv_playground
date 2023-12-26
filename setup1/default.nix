# default.nix

{ pkgs ? import <nixpkgs> {} }:
pkgs.poetry2nix.mkPoetryApplication {
  projectDir = ./.;
  #preferWheels = true; # should enable faster compilation time
}