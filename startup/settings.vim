let mapleader=','
let maplocalleader=','

set cursorline 
set number
set ruler
"set spell spelllang=en_us

" TeX-9
"let g:tex_flavor = 'latex'
let g:text_fold_enable = 1
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR> 
let g:tex_fast= ""


" UltiSnipsEdit to split your window 
let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" " (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
