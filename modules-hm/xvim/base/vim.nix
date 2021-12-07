{config, pkgs, lib, ...}:
with lib;
{
  options = {
    modules.xvim.vim.base = import ./options.nix {
      name = "vim";
      inherit lib;
    };
  };

  config = let
    cfg = config.modules.xvim.vim.base;
  in mkIf cfg.enable {
    programs.vim = {
      enable = true;
      extraConfig = concatStringsSep "\n" cfg.configs;
      inherit (cfg) plugins;
    };

    home.packages = cfg.extraPackages;
  };
}
