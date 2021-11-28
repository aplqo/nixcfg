{ pkgs, lib, ...}:
{
  config = {
    programs.vim = {
      enable = true;
      extraConfig = (builtins.readFile ./basic.vim) + ''
        let g:moonflyTransparent = 1
        colorscheme moonfly
        '';
      plugins = [ 
        pkgs.vimPlugins.vim-nix
        (lib.callPackageWith pkgs ../../pkgs/vimPlugins/vim-moonfly-colors.nix {})
      ];
    };
  };
}
