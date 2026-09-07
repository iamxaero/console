
let g:indent_guides_default_mapping = 0
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

nmap <silent><unique> <Leader>IG <Plug>IndentGuidesToggle
autocmd FileType pug,python call s:enable_indent_guides()
function! s:enable_indent_guides()
  autocmd VimEnter * :IndentGuidesEnable
endfunction
