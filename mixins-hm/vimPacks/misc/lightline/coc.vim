let g:lightline = { 
        \ 'colorscheme': 'one', 
        \ 'active': { 
        \   'left': [ [ 'mode', 'paste' ], 
        \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ }, 
        \ 'component_function': { 
        \   'cocstatus': 'coc#status' 
        \ }, 
        \ } 

" Use autocmd to force lightline update. 
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
