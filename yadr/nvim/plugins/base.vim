" Base vim plugins
call dein#add("Shougo/unite.vim")
call dein#add("Shougo/vimfiler.vim")
call dein#add("Shougo/vimshell.vim")
call dein#add("Shougo/deoplete.nvim")
call dein#add("Shougo/vimproc.vim", {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ })
call dein#add("tpope/vim-abolish")
call dein#add("tpope/vim-endwise.git")
call dein#add("tpope/vim-ragtag")
call dein#add("tpope/vim-repeat.git")
call dein#add("tpope/vim-surround.git")
call dein#add("tpope/vim-unimpaired")
call dein#add("xolox/vim-misc")
call dein#add("xolox/vim-session")
call dein#add("vimplugin/project.vim")
