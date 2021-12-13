{pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    plugins = with pkgs; [
      tmuxPlugins.nord
    ];
    extraConfig = ''
      set -g mouse on
    '';
  };
}
