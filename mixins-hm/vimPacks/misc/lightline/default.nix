name: {config, pkgs, ...}: {
  modules.xvim.${name}.base = {
    plugins = [ pkgs.vimPlugins.lightline-vim ];
    configs = [
      "set laststatus=2"
      (builtins.readFile (
        if config.modules.xvim.${name}.coc.enable
        then ./coc.vim
        else ./base.vim
      ))
    ];
  };
}
