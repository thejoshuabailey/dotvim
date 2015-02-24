" Vim indent file
" Language:     LaTeX
" Maintainer:   Johannes Tanzler <jtanzler@yline.com>
" Created:      Sat, 16 Feb 2002 16:50:19 +0100
" Last Change:	Sun, 17 Feb 2002 00:09:11 +0100
" Last Update:  2013-08-06
"               ET: Modified this script for TeX 9. Items are indented
"               automatically.
" Version: 1.3.13

" Disable system wide indentation
let b:did_indent = 1 

" Control TeX-9 indentation
if exists("b:did_tex_nine_indent") | finish
endif
let b:did_tex_nine_indent = 1

setlocal indentexpr=TeXNineIndent()
setlocal nolisp
setlocal nosmartindent
setlocal autoindent
setlocal indentkeys+=},=\\item,=\\bibitem

" Only define the function once
if exists("*TeXNineIndent") | finish
endif

function TeXNineIndent()

    " Find a non-blank line above the current line.
    let lnum = prevnonblank(v:lnum - 1)

    " At the start of the file use zero indent.
    if lnum == 0 | return 0 
    endif

    let ind = indent(lnum)
    let line = getline(lnum)             " first line in the current range
    let cline = getline(v:lnum)          " current line

    if line =~ '^\s*%'
        return ind " Do not change indentation of commented lines.
    endif

    let openingpat = '\\\(begin\|section\*\=\|paragraph\*\=\)\(\[.\+\]\)\={\(.*\)}'
    let endpat = '\\\(end\|section\*\=\|paragraph\*\=\)\(\[.\+\]\)\={\(.*\)}'
    let excluded = 'begin{document}\|begin{verbatim}\|end{document}\|end{verbatim}'

    " Add/remove a 'shiftwidth' after an environment begins/ends.
    " Add an additional 'shiftwidth' when entering a list and when typing in
    " an item of a list. 
    if line =~ openingpat && line !~ excluded
        let ind += &sw

        " Add another sw for item-environments
        if line =~ 'itemize\|description\|enumerate\|thebibliography\|parts'
            let ind += &sw
        endif
    endif

    " Subtract a 'shiftwidth' when an environment ends
    if cline =~ endpat && cline !~ excluded
        let ind -= &sw
        " Remove another sw for item-environments
        if cline =~ 'itemize\|description\|enumerate\|thebibliography\|parts' 
            let ind -= &sw
        endif
    endif

    " Special treatment for 'item'
    if cline =~ '^\s*\\\(bib\)\=item\|^\s*\\part' 
        let ind -= &sw
    endif

    if line =~ '^\s*\\\(bib\)\=item\|^\s*\\part' 
        let ind += &sw
    endif

    return ind
endfunction

" vim: fdm=marker
