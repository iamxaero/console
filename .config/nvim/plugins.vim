" ========================================
" Vim plugin configuration
" ========================================

if &compatible
  set nocompatible
endif

set runtimepath^=~/.config/nvim/thex
set runtimepath^=~/.config/nvim/dein

call dein#begin(expand('~/.config/nvim/cache'))

call dein#add(expand('~/.config/nvim/dein'))

for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
  exec "source " . f
endfor

call dein#end()

"Filetype plugin indent on is required by vundle
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
