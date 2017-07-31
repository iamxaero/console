" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  if !isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
  endif
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Session Storage ==================

let g:session_directory = '~/.vim/sessions'
let g:session_autosave = 'no'
let g:session_autoload = 'no'

