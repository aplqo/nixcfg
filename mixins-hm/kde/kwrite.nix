{pkgs, lib, ...}: {
  xdg.configFile."kwriterc".text = lib.generators.toINI {} {
    "KTextEditor Document" = {
      "Indentation Width" = 2;
      "Tab Width" = 2;
    };
    "KTextEditor Renderer".Font = "Cascadia Code,10,-1,5,50,0,0,0,0,0";
    "KTextEditor View" = {
      "Input Mode" = 1; # vi input
      "Vi Input Mode Steal Keys" = true;
    };
  };
}
