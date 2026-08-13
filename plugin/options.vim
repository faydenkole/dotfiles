vim9script

# Enable :Man command
runtime! ftplugin/man.vim

# Keep from those shit
mkdir(expand('~/.local/state/vim/backup/'), 'p')
mkdir(expand('~/.local/state/vim/swap/'), 'p')
mkdir(expand('~/.local/state/vim/undo/'), 'p')
set backupdir=$HOME/.local/state/vim/backup//
set directory=$HOME/.local/state/vim/swap//
set undodir=$HOME/.local/state/vim/undo//
g:netrw_home = expand('~/.local/state/vim')

if has("gui_running")
    set guifont=Fira\ Code\ 16
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set guioptions-=a
    set guioptions+=d
    set guioptions+=c
    set lines=999 columns=999
    set termguicolors
endif

syntax on
filetype plugin indent on
set nocompatible
set number
set cursorline
set autowrite
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set mouse=a
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard=unnamedplus
set hidden
set backup
set writebackup
set swapfile
set updatetime=100
set scrolloff=2 
set shortmess+=c
set autochdir
set splitright

# Status line
set laststatus=2
set statusline=\ %M\ \ %f\ \ %y\ %=\ %{g:actual_curbuf->getbufvar('&fileencoding','utf-8')}\ \ %l/%c\ \ %p%%\ 


colorscheme gruvbox

augroup VimAutoCompleteSave
    autocmd!
    autocmd BufLeave,FocusLost * {
        if &modified && !empty(expand('%:t')) && &buftype == '' && &modifiable
            silent! write
        endif
    }
augroup END
