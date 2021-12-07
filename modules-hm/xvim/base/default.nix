{config, pkgs, lib, ...}:
with lib;
{
  imports = [
    ./vim.nix
    ./neovim.nix
  ];

  options = {
    modules.xvim.all.base = import ./options.nix {
      name = "all";
      inherit lib;
    };
  };

  config = let
    cfg = config.modules.xvim.all.base;
    push = if cfg.enable
      then cfg
      else builtins.removeAttrs cfg [ "enable" ];
  in {
    modules.xvim = {
      vim.base = push;
      neovim.base = push;
    };
  };
}
