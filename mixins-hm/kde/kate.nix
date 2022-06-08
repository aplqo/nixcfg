{pkgs, lib, ...}: {
  xdg.configFile."katerc".text = lib.generators.toINI {} {
    General = {
      "Expand Tabs" = true;
    };
    "KTextEditor Document" = {
      "Indentation Width" = 2;
      "Tab Width" = 2;
    };
    "KTextEditor View" = {
      "Input Mode" = 1; # vi input
      "Vi Input Mode Steal Keys" = true;
    };
    "KTextEditor Renderer".Font = "Cascadia Code,10,-1,5,50,0,0,0,0,0";
  };
}
