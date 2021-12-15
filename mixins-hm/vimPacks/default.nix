let
  lib = import ../../modules-hm/xvim/lib.nix;
  customPkgs = import ../../pkgs/vimPlugins;
in rec {
  configs = import ./configs { inherit lib customPkgs; };

  themes = {
    moonfly = { enable ? false }: lib.mkPack (args@{lib, ...}: {
      base = {
        plugins = [ (customPkgs args).themes.vim-moonfly-colors ];
        configs = builtins.filter (v: v != "") [ 
          "let g:moonflyTransparent = 1"
          (lib.optionalString enable "colorscheme moonfly")
        ];
      };
    });
  };

  languages = {
    nix = lib.mkPack ({pkgs, ...}: {
      base.plugins = [ pkgs.vimPlugins.vim-nix ];
    });
  };

  coc = import ./coc { inherit lib customPkgs; };

  profiles = {
    basic = lib.mkPackDep {
      depends = [
        configs.base
        (themes.moonfly { enable = true; })
      ];
    };

    coc = lib.mkPackDep {
      depends = [
        configs.coc
        coc.lists
        coc.highlight
        coc.explorer
      ];
      config = {pkgs, ...}: {
        coc.extensions = [ pkgs.vimPlugins.coc-git ];
      };
    };
  };
}
