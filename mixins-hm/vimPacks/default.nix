let
  lib = import ../../modules-hm/xvim/lib.nix;
  customPkgs = import ../../pkgs/vimPlugins;
in rec {
  configs = import ./configs { inherit lib customPkgs; };

  themes = let
    mkTheme = { name, pkg }: { enable ? false }: lib.mkPack ({pkgs, lib, ...}: {
      base = {
        plugins = [ pkgs.vimPlugins.${pkg} ];
        configs = lib.optional enable [ "colorscheme ${name}" ];
      };
    });
  in {
    edge = mkTheme { name = "edge"; pkg = "edge"; };

    moonfly = { enable ? false }: lib.mkPack (args@{lib, ...}: {
      base = {
        plugins = [ (customPkgs args).themes.vim-moonfly-colors ];
        configs = builtins.filter (v: v != "") [ 
          "let g:moonflyTransparent = 1"
          (lib.optionalString enable "colorscheme moonfly")
        ];
      };
    });

    nord = mkTheme { name = "nord"; pkg = "nord-vim"; };
  };

  languages = {
    haskell = lib.mkPack ({pkgs, ...}: {
      base = {
        plugins = [ pkgs.vimPlugins.haskell-vim ];
        extraPackages = [ pkgs.haskell-language-server ];
      };
      coc.config = {
        languageserver.haskell = {
          command = "haskell-language-server-wrapper";
          args = [ "--lsp" ]; 
          rootPatterns = [
            "*.cabal"
            "stack.yaml"
            "cabal.project"
            "package.yaml"
            "hie.yaml"
          ]; 
          filetypes = [
            "haskell"
            "lhaskell"
          ];
        };
      };
    });

    json = lib.mkPack ({pkgs, ...}: {
      coc = {
        extensions = [ pkgs.vimPlugins.coc-json ];
        config = {
          "json.format.enable" = true;
          "coc.preferences.formatOnSaveFiletypes" = [ "json"  "jsonc" ];
        };
      };
    });

    nix = lib.mkPack ({pkgs, ...}: {
      base.plugins = [ pkgs.vimPlugins.vim-nix ];
    });
  };

  coc = import ./coc { inherit lib customPkgs; };

  misc = import ./misc { inherit lib customPkgs; };

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
