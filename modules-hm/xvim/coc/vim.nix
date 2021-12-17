{config, pkgs, lib, ...}: 
with (import ./options.nix { 
  inherit pkgs lib; 
});
{
  options = {
    modules.xvim.vim.coc = opts;
  };

  config = let
    cfg = config.modules.xvim.vim.coc;
  in lib.mkIf cfg.enable {
    programs.vim.plugins = cfg.extensions ++ [ pkgs.vimPlugins.coc-nvim ]; 

    home = {
      packages = [ pkgs.nodejs ];
      file.".vim/coc-settings.json".source = jsonFormat.generate "coc-settings.json" cfg.config;
    };
  };
}
