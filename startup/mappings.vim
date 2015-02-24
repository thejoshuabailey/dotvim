" Change cursor position in insert mode "
inoremap <C-h> <left>
inoremap <C-l> <right> 

" ctrl-u make a word upper case in normal mode 
nnoremap <c-u> viwU

" edit my vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 

" source my vimrc file 
nnoremap <leader>sv :source $MYVIMRC<cr> 

" Map H in normal mode to go to the beginning of the current line
nnoremap H 0

" Map L in normal mode to go to the end of the current line. 
nnoremap L $

" Map jk in insert mode to <esc> 
inoremap jk <esc>

" Vimscript file settings ----------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc> 
augroup END
" }}}
" Javascrip file settings --------------------- {{{
augroup filetype_javascript 
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc> 
	autocmd FileType javascript iabbrev <buffer> iff if ()<left> 
augroup END
" }}}
" Python file settings ------------------------- {{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc> 
	autocmd FileType python iabbrev <buffer> iff if:<left> 
augroup END 
" }}}
" Tex file settings ---------------------------- {{{
augroup filetype_tex
	autocmd!
	" LaTeX (ruber) macro for compiling 
	autocmd FileType tex nnoremap <leader>r :w<CR>:!rubber --pdf --warn all %<CR> 
	" evince 
	" View PDF macro; '%:r' is current file's root (base) name.
	autocmd FileType tex nnoremap <leader>v :!evince %:r.pdf &<cr><cr> 

	"Greek  
	autocmd FileType tex inoremap <buffer> <localleader>a \alpha
	autocmd FileType tex inoremap <buffer> <localleader>b \beta 
	autocmd FileType tex inoremap <buffer> <localleader>d \delta 
	autocmd FileType tex inoremap <buffer> <localleader>e \epsilon 
	autocmd FileType tex inoremap <buffer> <localleader>g \gamma 
	autocmd FileType tex inoremap <buffer> <localleader>o \omega 
	autocmd FileType tex inoremap <buffer> <localleader>p \pi 
	autocmd FileType tex inoremap <buffer> <localleader>s \sigma
	autocmd FileType tex inoremap <buffer> <localleader>t \tau
	autocmd FileType tex inoremap <buffer> <localleader>D \Delta 

	autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc> 
augroup END
" }}}
