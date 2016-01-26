" local syntax file - set colors on a per-machine basis:
" Maintainer: Filipe Utzig (filipeutzig@gmail.com)
" Last Change: 2014, Aug 05.

if exists("syntax_on")
  syntax reset
endif

highlight clear
colorscheme gringolito
set cc=100                " ruler

" script que fecha caracteres '(', '{' e '['
inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
inoremap { {}<esc>:call BC_AddChar("}")<cr>i
inoremap [ []<esc>:call BC_AddChar("]")<cr>i
inoremap \" \""<esc>:call BC_AddChar("\"")<cr>i

"inoremap <C-j> <esc>:call search(BC_GetChar(), "W")<cr>a

function! BC_AddChar(schar)
  if exists("b:robstack")
    let b:robstack = b:robstack . a:schar
  else
    let b:robstack = a:schar
  endif
endfunction

winsize 104 50
set guioptions-=l
set guioptions-=L
set guioptions-=T

function! ToggleFlag(option,flag)
  exec ('let lopt = &' . a:option)
  if lopt =~ (".*" . a:flag . ".*")
    exec ('set ' . a:option . '-=' . a:flag)
  else
    exec ('set ' . a:option . '+=' . a:flag)
  endif
endfunction

function! ToggleFullscreen()
  exec ToggleFlag("guioptions","m")
  exec system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endfunction

map <silent> <F11> :call ToggleFullscreen()<CR>
