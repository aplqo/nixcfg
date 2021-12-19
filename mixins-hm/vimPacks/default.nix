let
  lib = import ../../modules-hm/xvim/lib.nix;

  call = path: import path { inherit lib; };
in rec {
  configs = call ./configs;

  themes = let
    mkTheme = { name, pkg }: { enable ? false }: lib.mkPack ({pkgs, lib, ...}: {
      base = {
        plugins = [ pkgs.vimPlugins.${pkg} ];
        configs = lib.optional enable [ "colorscheme ${name}" ];
      };
    });
  in {
    edge = mkTheme { name = "edge"; pkg = "edge"; };

    moonfly = { enable ? false }: lib.mkPack ({pkgs, lib, ...}: {
      base = {
        plugins = [ pkgs.vimPlugins.vim-moonfly-colors ];
        configs = builtins.filter (v: v != "") [ 
          "let g:moonflyTransparent = 1"
          (lib.optionalString enable "colorscheme moonfly")
        ];
      };
    });

    nord = mkTheme { name = "nord"; pkg = "nord-vim"; };
  };

  languages = call ./languages;

  coc = call ./coc;

  misc = call ./misc;

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
