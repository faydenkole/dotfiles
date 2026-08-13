vim9script

autocmd User LspSetup call LspOptionsSet({completionMatcher: 'fuzzy', autoHighlight: true, hoverOnCursorHold: true, noNewlineInCompletion: true})

var lspServers = [
    {
        name: 'pylsp',
        filetype: ['python'],
        path: 'uv',
        args: ['run', 'pylsp'],
        rootSearch: ['.venv/', 'pyproject.toml', 'setup.py', 'requirements.txt']
    },
    {
        name: 'clangd',
        filetype: ['c', 'cpp'],
        path: 'clangd',
        args: ['--background-index']
    }

]
autocmd User LspSetup g:LspAddServer(lspServers)

autocmd User LspAttached {
    nnoremap <buffer> <silent> gd <cmd>LspGotoDefinition<cr>
    nnoremap <buffer> <silent> K  <cmd>LspHover<cr>
    nnoremap <buffer> <silent> [d <cmd>LspDiag prev<cr>
    nnoremap <buffer> <silent> ]d <cmd>LspDiag next<cr>
    nnoremap <buffer> <silent> <leader>rn <cmd>LspRename<cr>
    nnoremap <buffer> <silent> <leader>ca <cmd>LspCodeAction<cr>
    
    nnoremap <buffer> <silent> <leader>gh <cmd>LspSwitchSourceHeader<cr>
}

autocmd User LspDetached {
    silent! unmap <buffer> gd
    silent! unmap <buffer> K
    silent! unmap <buffer> [d
    silent! unmap <buffer> ]d
    silent! unmap <buffer> <leader>rn
    silent! unmap <buffer> <leader>ca
    silent! unmap <buffer> <leader>gh
}
