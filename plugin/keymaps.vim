vim9script

# Basic Keymaps
g:mapleader = " "
g:maplocalleader = " "
inoremap jk <Esc>
nnoremap <leader>t <CMD>tab terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Up> <CMD>resize -2<CR>
nnoremap <C-Down> <CMD>resize +2<CR>
nnoremap <C-Left> <CMD>vertical resize -2<CR>
nnoremap <C-Right> <CMD>vertical resize +2<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-ScrollWheelUp> <CMD>silent! let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0) + 1', '')<CR>
nnoremap <C-ScrollWheelDown> <CMD>silent! let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0) - 1', '')<CR>
