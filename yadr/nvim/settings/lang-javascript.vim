
let g:syntastic_javascript_checkers = ['standard']

autocmd bufwritepost *.js silent !standard-format -w %
set autoread
