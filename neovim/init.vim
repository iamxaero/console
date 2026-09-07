" Python/neovim hosts не нужны — uv run handles it.
" 
" ================ Shared Base Config ====================
" Общие настройки для vim и neovim
if filereadable(expand("~/.config/nvim/base.vim"))
  source ~/.config/nvim/base.vim
endif

" ================ NVim-specific ======================
set mouse                 "Neovim mouse support

" ============== Plugin Initialization ==============
" This loads all the plugins specified in ~/.config/nvim/plugins.vim
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" ================ Custom Settings ========================
source ~/.config/nvim/settings.vim
