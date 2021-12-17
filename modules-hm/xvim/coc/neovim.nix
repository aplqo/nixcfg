{config, pkgs, lib, ...}: 
with (import ./options.nix {
  inherit pkgs lib;
});
{  
  options = {
    modules.xvim.neovim.coc = opts;
  };

  config = let
    cfg = config.modules.xvim.neovim.coc;
  in lib.mkIf cfg.enable {
    modules.xvim.neovim.base = {
      plugins = cfg.extensions ++ [ pkgs.vimPlugins.coc-nvim ];
      # workaround for glob in runtimepath
      configs = [ ''
        au VimEnter * let &runtimepath = join(globpath(&runtimepath, "", 0, 1), ',')
      '' ];
      extraPackages = [ pkgs.nodejs ];
    };
    programs.neovim.withNodeJs = true;

    xdg.configFile."nvim/coc-settings.json".source = jsonFormat.generate "coc-settings.json" cfg.config;
  };
}
