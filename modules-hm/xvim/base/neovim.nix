{config, pkgs, lib, ...}:
with lib;
{
  options = {
    modules.xvim.neovim.base = import ./options.nix {
      name = "neovim";
      inherit lib;
    };
  };

  config = let
    cfg = config.modules.xvim.neovim.base;
  in mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      extraConfig = concatStringsSep "\n" cfg.configs;
      inherit (cfg) plugins extraPackages;
    };
  };
}
