" https://github.com/Shougo/vimfiler.vim

" call vimfiler#set_execute_file('txt', 'notepad')
" call vimfiler#set_execute_file('c', ['gvim', 'notepad'])

let g:vimfiler_as_default_explorer = 1

" Side explorer
nnoremap <silent><C-\> :<C-u>VimFilerExplorer -no-toggle -auto-cd -find<CR>

" Enable file operation commands.
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'status' : 1,
      \ 'edit_action' : 'open',
      \ })

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" Use trashbox.
" Windows only and require latest vimproc.
"let g:unite_kind_file_use_trashbox = 1

autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()

  nmap <buffer> <Esc> <Plug>(vimfiler_hide)
  nmap <buffer> q <Plug>(vimfiler_hide)

  nmap <buffer> o <Plug>(vimfiler_cd_or_edit)
  nmap <buffer> <Enter> <Plug>(vimfiler_expand_or_edit)

  nnoremap <silent><buffer><expr> v
        \ vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> s
        \ vimfiler#do_switch_action('split')
endfunction

