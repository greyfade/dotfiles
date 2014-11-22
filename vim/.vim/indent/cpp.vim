" Vim indent file
" Language:	C++
" Maintainer:	Charles Banas <greyfade@greyfade.org>
" Last Change:	2010 May 27
" Version: 1.0.1

if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

function! GreyfadeCppIndent()
  let l:cline_num = line('.')
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    let l:pline_num = prevnonblank(l:pline_num - 1)
    let l:pline = getline(l:pline_num)
  endwhile
  let l:retv = cindent('.')
  if l:pline =~# '^\s*template.*'
    let l:retv = cindent(l:pline_num)
  elseif l:pline =~# '^\s*namespace.*'
    let l:retv = 0
  endif

  return l:retv
endfunction

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal noexpandtab
setlocal textwidth=80
setlocal nowrap

setlocal cindent
setlocal cinoptions=l1,g0,t0,i6,+6,(0,w1,W6

setlocal indentexpr=GreyfadeCppIndent()

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

