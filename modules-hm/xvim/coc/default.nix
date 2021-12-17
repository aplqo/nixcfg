{config, pkgs, lib, ...}:
{
  imports = [
    ./vim.nix
    ./neovim.nix
  ];

  options = {
    modules.xvim.all.coc = (import ./options.nix {
      inherit pkgs lib;
    }).opts;
  };

  config = let
    cfg = config.modules.xvim.all.coc;
    push = if cfg.enable
      then cfg
      else builtins.removeAttrs cfg [ "enable" ];
  in {
    modules.xvim = {
      vim.coc = push;
      neovim.coc = push;
    };
  };
}
