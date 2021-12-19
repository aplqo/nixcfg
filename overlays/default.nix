{
  vimPlugins = final: prev: prev.lib.recursiveUpdate prev {
    vimPlugins = prev.callPackage ../pkgs/vimPlugins {};
  };
}
