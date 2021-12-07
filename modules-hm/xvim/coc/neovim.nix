{config, pkgs, lib, ...}: {
  options = {
    modules.xvim.neovim.coc = (import ./options.nix {
      inherit pkgs lib;
    }).opts;
  };

  config = let
    cfg = config.modules.xvim.neovim.coc;
  in lib.mkIf cfg.enable {
    programs.neovim.coc = {
      enable = true;
      settings = cfg.config;
    };

    home.packages = cfg.extensions;
  };
}
