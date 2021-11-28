{pkgs, ...}:
{
  config = {
    programs.vim = {
      enable = true;
      settings = {
        number = true;
        mouse = "a";
      };
      extraConfig = (builtins.readFile ./basic.vim);
      plugins = [ pkgs.vimPlugins.vim-nix ];
    };
  };
}
