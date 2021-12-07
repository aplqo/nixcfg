{lib, ...}:
{
  base = lib.mkPack (args: {
    base.configs = [ (builtins.readFile ./base.vim) ];
  });

  coc = lib.mkPack (args: {
    base.configs = [ (builtins.readFile ./coc_configs.vim) ]; 
    coc.enable = true;
  });
}
