" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ Shared Base Config ====================
" Общие настройки для vim и neovim
if filereadable(expand("~/.config/nvim/base.vim"))
  source ~/.config/nvim/base.vim
elseif filereadable(expand("~/.vim/base.vim"))
  source ~/.vim/base.vim
endif

" ================ Custom Settings ========================
so ~/.vim/settings.vim
