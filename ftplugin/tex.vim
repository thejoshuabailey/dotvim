setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
	setlocal makeprg=make
else
	exec "setlocal makeprg=make\\ -f\\ ~/academic/tools/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif

