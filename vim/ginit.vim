" vim600: set foldmethod=marker:
"
" local syntax file: set colors and useful options
"
" Maintainer: Filipe Utzig (filipeutzig@gmail.com)
" Last Change: 2016, Mar 16.
" License:
"
" "THE BEER-WARE LICENSE" (Revision 42):
" <filipeutzig@gmail.com> wrote this file.  As long as you retain this notice you
" can do whatever you want with this stuff. If we meet some day, and you think
" this stuff is worth it, you can buy me a beer in return.   Filipe Utzig
"
" Section: Code highlight and colorscheme {{{1
" Fix syntax highlighting and set a colorscheme
"if exists("syntax_on")
"    syntax reset
"endif
"highlight clear
colorscheme gringolito

" Section: GUI Options {{{1
" Set font for neovim-qt
GuiFont DejaVu Sans Mono:h10

" Set window size of GVim when opening a new window
" winsize 104 60

" Section: Fullscreen support {{{1
" Adds fullscreen support for GVim (mapped in F11)
" This script needs wmctrl to work properly (apt-get install wmctrl)
function! ToggleFlag(option,flag)
    exec('let lopt = &' . a:option)
    if lopt =~ (".*" . a:flag . ".*")
        exec('set ' . a:option . '-=' . a:flag)
    else
        exec('set ' . a:option . '+=' . a:flag)
    endif
endfunction

function! ToggleFullscreen()
    exec ToggleFlag("guioptions","m")
    exec system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endfunction

map <silent> <F11> :call ToggleFullscreen()<CR>

