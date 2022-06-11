{
  base = { pkgs, ...}: {
    programs.vscode = {
      userSettings = {
        "editor.fontFamily" = "'Cascadia Code', 'Droid Sans Mono', 'monospace', monospace";
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "terminal.integrated.cursorStyle" = "line";
      };
    };
  }; 

  neovim = {pkgs, ...}: {
    programs.vscode = {
      extensions = [pkgs.vscode-extensions.asvetliakov.vscode-neovim];
      userSettings = {
        "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim.outPath}/bin/nvim";
      };
    };
  };

  language = {
    antlr4 = {pkgs, ...}: {
      programs.vscode = {
        extensions = [ pkgs.vscode-extensions.mike-lischke.vscode-antlr4 ];
        userSettings = {
          "antlr4.referencesCodeLens.enabled" = true;
        };
      };
    };

    scala = {pkgs, ...}: {
      programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
          scala-lang.scala
          scalameta.metals
        ];
        userSettings = {
          "metals.javaHome" = "${pkgs.jdk.outPath}/lib/openjdk";
          "metals.showInferredType" = true;
          "files.watcherExclude" = {
            "**/.bloop" = true;
            "**/.metals" = true;
            "**/.ammonite" = true;
          };
        };
      };
    };

    haskell = {pkgs, ...}: {
      programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
          haskell.haskell
          justusadam.language-haskell
        ];
        userSettings = {
          "haskell.serverExecutablePath" = "${pkgs.haskell-language-server.outPath}/bin/haskell-language-server-wrapper";
        };
      };
    };
  };
}
