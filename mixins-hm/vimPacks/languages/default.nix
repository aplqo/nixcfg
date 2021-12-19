{lib, customPkgs}:
{
  cpp = lib.mkPack ({pkgs, ...}: {
    base = {
      plugins = [ pkgs.vimPlugins.vim-lsp-cxx-highlight ];
      extraPackages = [ pkgs.clang-tools ];
    };
    coc = {
      extensions = [ pkgs.vimPlugins.coc-clangd ];
      config = {
        "clangd.semanticHighlighting" = true;
      };
    };
  });

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

  rust = lib.mkPack ({pkgs, ...}: {
    base.extraPackages = [ pkgs.rust-analyzer ];
    coc = {
      extensions = [ pkgs.vimPlugins.coc-rust-analyzer ];
      config = {
        "rust-analyzer.server.path" = "${pkgs.rust-analyzer.outPath}/bin/rust-analyzer";
        "coc.preferences.formatOnSaveFiletypes" = [ "rust" ];
      };
    };
  });

  yaml = lib.mkPack ({pkgs, ...}: {
    coc = {
      extensions = [ pkgs.vimPlugins.coc-yaml ];
      config = {
        "yaml.format.enable" = true;
        "coc.preferences.formatOnSaveFiletypes" = [ "yaml" ];
      };
    };
  });
}
