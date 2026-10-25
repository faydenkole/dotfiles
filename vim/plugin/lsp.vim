vim9script

g:lsp_server_list = [{
    name: 'clangd',
    filetypes: ['c', 'cpp'],
    cmd: ['clangd', '--compile-commands-dir=build'],
    rootPatterns: ['compile_commands.json', '.git'],
}, {
    name: 'pylsp',
    filetypes: ['python'],
    cmd: ['uv', 'run', 'pylsp'],
    rootPatterns: ['pyproject.toml', '.git'],
}, {
    filetypes: ['vim'],
    name: 'vim9ls',
    cmd: function('vim9ls#Command')
}, {
    filetypes: ['sh'],
    name: 'bash-lsp',
    cmd: ['bash-language-server', 'start'],
}]

def LspBuffer()
  # 'autocomplete' offers what 'complete' names, and "o" names 'omnifunc',
  # which the plugin has set.
  setlocal complete^=o
  setlocal autocomplete
  # "menuone" for a single match, "popup" for the resolved documentation.
  setlocal completeopt=menuone,popup,fuzzy
  # So the text stays put as a sign comes and goes.
  setlocal signcolumn=yes
  # So K asks the server rather than the program it otherwise names.
  setlocal keywordprg=:LspHover

  nnoremap <buffer> gd <Cmd>LspDefinition<CR>
enddef

# Fired for a buffer a server has taken on, so where a server is set up but
# not installed, the buffer is left as it was.
augroup lsprc
  autocmd!
  autocmd User LspAttached LspBuffer()
augroup END

autocmd User LspAttached {
    nnoremap <buffer> <silent> gd <cmd>LspDefinition<cr>
    nnoremap <buffer> <silent> [d <cmd>LspDiag prev<cr>
    nnoremap <buffer> <silent> ]d <cmd>LspDiag next<cr>
    nnoremap <buffer> <silent> <leader>rn <esc>:LspRename 
    nnoremap <buffer> <silent> <leader>ca <cmd>LspCodeAction<cr>
    nnoremap <buffer> <silent> <leader>gh <cmd>LspSwitchSourceHeader<cr>
}

autocmd User LspDetached {
    silent! unmap <buffer> gd
    silent! unmap <buffer> [d
    silent! unmap <buffer> ]d
    silent! unmap <buffer> <leader>rn
    silent! unmap <buffer> <leader>ca
    silent! unmap <buffer> <leader>gh
}
