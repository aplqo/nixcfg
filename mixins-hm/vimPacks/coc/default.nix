{lib, ...}:
{
  explorer = lib.mkPack ({pkgs, ...}: {
    base.configs = [''
        nmap <space>e <Cmd>CocCommand explorer<CR>
    ''];

    coc.extensions = [ pkgs.vimPlugins.coc-explorer ];
  });

  lists = lib.mkPack ({pkgs, ...}: {
    base.configs = [ (builtins.readFile ./coc-lists.vim) ];

    coc.extensions = [ pkgs.vimPlugins.coc-lists ];
  });

  highlight = lib.mkPack ({pkgs, ...}: {
    base.configs = [''
      " Highlight the symbol and its references when holding the cursor.
      autocmd CursorHold * silent call CocActionAsync('highlight')
    ''];

    coc.extensions = [ pkgs.vimPlugins.coc-highlight ];
  });
}
