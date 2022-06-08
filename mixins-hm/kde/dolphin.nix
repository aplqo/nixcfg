{pkgs, lib, ...}: {
  xdg.configFile."dolphinrc".text = lib.generators.toINI {} {
    DetailsMode.PreviewSize = 16;
  };
}
