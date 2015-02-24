set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugins  -------------------------- {{{ 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'tpope/vim-fugitive'

Plugin 'L9'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdtree'

Plugin 'SirVer/ultisnips'

"Plugin 'matze/vim-tex-fold'

"Plugin 'vim-scripts/TeX-PDF'

Plugin 'vim-scripts/TeX-9'

Plugin 'ervandew/supertab'

Plugin 'Valloric/YouCompleteMe'

Plugin 'godlygeek/tabular'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Status Lines ---------------------- {{{
set laststatus=2 " Always show status line 
set statusline+=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/  " Separator
set statusline+=%L " Total lines
" }}}

" Load custom settings 
"source ~/.vim/startup/settings.vim
"source ~/.vim/startup/mappings.vim



" General settings --------------------- {{{
set cursorline 
set showcmd
set number
set ruler
set wildmenu 


set hlsearch " highlight search 
set ignorecase " Ignore case in search patterns
set smartcase " Be sensitive when there's a capital letter 
set incsearch " Matched string is highlighted while typing  

set completeopt=menu

set mouse=a " Enable the use of the mouse 


"set spell spelllang=en_us

" TeX-9
let g:tex_flavor = 'latex'
"let g:text_fold_enable = 1
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

" }}}

" Global mappings ------------------- {{{
let mapleader=','

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
" }}} 

" Local settings and mappings --------------------- {{{
let maplocalleader=','

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
	"autocmd FileType tex nnoremap <leader>r :w<CR>:!rubber --pdf --warn all %<CR> 
	" evince 
	" View PDF macro; '%:r' is current file's root (base) name.
	"autocmd FileType tex nnoremap <leader>v :!evince %:r.pdf &<cr><cr> 
	autocmd FileType tex setlocal foldmethod=marker
	

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

" }}}
