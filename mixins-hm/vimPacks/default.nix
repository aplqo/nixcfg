let
  lib = import ../../modules-hm/xvim/lib.nix;
  customPkgs = import ../../pkgs/vimPlugins;
in rec {
  configs = import ./configs { inherit lib customPkgs; };

  themes = {
    moonfly = lib.mkPack (args: {
      base = {
        plugins = [ (customPkgs args).themes.vim-moonfly-colors ];
        configs = [ ''
            let g:moonflyTransparent = 1
            colorscheme moonfly
        '' ];
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
        themes.moonfly
      ];
    };
  };
}
