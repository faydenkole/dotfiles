vim9script

# For 1 character to search before showing hints
noremap <leader><leader>f <Cmd>call stargate#OKvim(1)<CR>
# For 2 consecutive characters to search
noremap <leader><leader>F <Cmd>call stargate#OKvim(2)<CR>

# Instead of 1 or 2 you can use any higher number, but it isn't much practical
# and it is easier to use `/` or `?` for that
