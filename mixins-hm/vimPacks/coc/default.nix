{lib, ...}:
{
  exporer = lib.mkPack ({pkgs, ...}: {
    base.configs = [''
        nmap <space>e <Cmd>CocCommand explorer<CR>
    ''];

    coc.extensions = [ pkgs.vimPlugins.coc-explorer ];
  });

  lists = lib.mkPack ({pkgs, ...}: {
    base.configs = [ (builtins.readFile ./coc-lists.nix) ];

    coc.extensions = [ pkgs.vimPlugins.coc-lists ];
  });
}
