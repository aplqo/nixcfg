{
  vimPlugins = final: prev: prev.lib.recursiveUpdate prev {
    vimPlugins = prev.callPackage ../pkgs/vimPlugins {};
  };

  vscode-extensions = final: prev: prev.lib.recursiveUpdate prev {
    vscode-extensions = prev.callPackage ../pkgs/vscodePlugins {};
  };
}
