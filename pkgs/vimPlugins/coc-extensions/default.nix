{pkgs, lib, nodejs, stdenv, vimUtils}:
let
  nodePackages = import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };

  extensions = lib.importJSON ./extensions.json;

  nodePackage2VimPackage = name: vimUtils.buildVimPluginFrom2Nix {
    pname = name;
    inherit (nodePackages.${name}) version meta;
    src = "${nodePackages.${name}}/lib/node_modules/${name}";
  };
in 
  lib.genAttrs extensions nodePackage2VimPackage
