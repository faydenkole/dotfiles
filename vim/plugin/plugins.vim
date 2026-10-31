vim9script


# Autoinstall plugin manager
const package_name = 'minpac'
const minpac_dir = $'{expand($MYVIMDIR)}/pack/{package_name}/opt/minpac'

if !isdirectory(minpac_dir)
  echom $"\"{minpac_dir}\" doesn't exist. Run :MinpacInstall to install."
  command MinpacInstall {
    execute printf('!git clone https://github.com/k-takata/minpac.git %s', minpac_dir)
    qall
  }
endif

if empty(glob($MYVIMDIR .. '/autoload/plugpac.vim'))
  silent execute $'!curl -fLo {$MYVIMDIR}/autoload/plugpac.vim --create-dirs https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim'
endif


# Plugin installation
plugpac#Begin({
  status_open: 'vertical',
  verbose: 2,
  quiet: v:false, # show no warning if any package is not installed
})

Pack 'k-takata/minpac', {'type': 'opt'}

Pack 'lambdalisue/vim-suda'
Pack 'bkad/CamelCaseMotion'
Pack 'vim-scripts/ReplaceWithRegister'
Pack 'nda-cunh/vim9-autopairs'
Pack 'monkoose/vim9-stargate'
Pack 'vim-fuzzbox/fuzzbox.vim'
Pack 'Bakudankun/minimap.vim'

Pack 'h-east/lsp.vim'
Pack 'h-east/vim9ls'

Pack 'tpope/vim-fugitive'
Pack 'habamax/vim-shout'

Pack 'morhetz/gruvbox'

plugpac#End()
