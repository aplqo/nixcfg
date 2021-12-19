{lib}:
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

  dhall = lib.mkPack ({pkgs, ...}: {
    base = {
      plugins = [ pkgs.vimPlugins.dhall-vim ];
      extraPackages = [ pkgs.dhall-lsp-server ];
    };
    coc.config = {
      languageserver.dhall = {
        command = "dhall-lsp-server";
        filetypes = [ "dhall" ];
      };
    };
  });
  
  fsharp = lib.mkPack ({pkgs, ...}: {
    base.plugins = [ pkgs.vimPlugins.vim-polyglot ];
    coc = {
      extensions = [ pkgs.vimPlugins.coc-fsharp ];
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

  scala = lib.mkPack ({pkgs, ...}: {
    coc = {
      extensions = [ pkgs.vimPlugins.coc-metals ];
      config = {
        "metals.javaHome" = "${pkgs.openjdk_headless.outPath}/lib/openjdk";
        "metals.statusBarEnabled" = true;
        "coc.preferences.formatOnSaveFiletypes" = [ "scala" ];
      };
    };
  });

  toml = lib.mkPack ({pkgs, ...}: {
    coc = {
      extensions = [ pkgs.vimPlugins.coc-toml ];
      config = {
        "toml.semanticTokens" = true;
        "coc.preferences.formatOnSaveFiletypes" = [ "toml" ];
      };
    };
  });

  typescript = lib.mkPack ({pkgs, ...}: {
    coc = {
      extensions = [ pkgs.vimPlugins.coc-tsserver ];
    };
  });

  xml = lib.mkPack ({pkgs, ...}: {
    coc = {
      extensions = [ pkgs.vimPlugins.coc-xml ];
      config = {
        "xml.java.home" = "${pkgs.openjdk_headless}/lib/openjdk";
        "coc.preferences.formatOnSaveFiletypes" = [ "xml" ];
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
