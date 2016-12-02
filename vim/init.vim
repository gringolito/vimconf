" vim600: set foldmethod=marker:
"
" Vim configuration
"
" Original Author: Rafael Zalamena <rzalamena@gmail.com>
" Maintainer: Filipe Utzig <filipeutzig@gmail.com>
" Last Change: 2016, Mar 17.
" License:
"
" "THE BEER-WARE LICENSE" (Revision 42):
" <filipeutzig@gmail.com> wrote this file.  As long as you retain this notice you
" can do whatever you want with this stuff. If we meet some day, and you think
" this stuff is worth it, you can buy me a beer in return.   Filipe Utzig
"
" Section: Custom settings {{{1
set nocompatible        " Became not compatible with Vi, required for the most of this vimrc
set title               " Change the window title to 'filename [++-] (path) - VIM'
set ruler               " Display the cursos current position
set hidden              " Don't unload buffer on window close
"set nohidden           " Unload buffer when window close, save a bit of memory, but is slower
set splitright          " When spliting panel, the new one will be in right side
set clipboard=unnamed   " Keep a single clipboard between all your vim sessions

" Section: Code highlight and colorscheme {{{2
if exists("syntax_on")
  syntax reset
endif
syntax on
highlight clear
colorscheme devbox-dark-256
set background=dark     " Use this if your colorscheme has a dark background

" Section: Language, spelling and enconding stuff {{{2
" Set file enconding to UTF-8
set termencoding=utf8
set encoding=utf8
try
    lang en_US
    catch
endtry

"set spell              " Enable spell checking
set nospell             " Disbale spell checking
set spelllang=en_US     " Set spell language

" Section: Indentation stuff {{{2
set tabstop=4           " Width (in spaces) that a <tab> is displayed as
set softtabstop=4       " Makes spaces feel like tabs (like deleting)
set shiftwidth=4        " Width (in spaces) used in each step of autoindent (aswell as << and >>)
set copyindent          " When auto-indenting, use the indenting format of the previous line
set smartindent         " Does the right thing (mostly) in programs
set cindent             " Stricter rules for C programs
"set noexpandtab        " Why the hell would I want space instead of tabs
set expandtab           " If you need to use spaces instead tabs

" Section: Cool stuff {{{1
" Enable block editing support (type Ctrl+V in normal-mode to start block selection)
set virtualedit=block

set number              " Show line numbers on left
set cursorline          " Highlight current line
"set nocursorline       " Disable current line highlighting
set colorcolumn=100     " Set horizontal ruler indicator size (in columns)
"set textwidth=100      " Automatic broke line after size (in columns)
set list                " Show hidden characters like tabs and lost spaces
set listchars+=tab:▸\    " Whats gonna be shown instead of TABs
set listchars+=trail:·  " Whats gonna be shown instead of trailling spaces
"set nowildmenu         " Disables improved command-line completion

" Complete till longest common string and show a list of possible completions
set wildmode=longest,list:full

" Adds a close section of the following characters: '(', '{', '[' and '"'
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>

" Good tab completion - press <TAB> to autocomplete if there's a character previously
set completeopt=menu,menuone,preview
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <TAB> <C-r>=InsertTabWrapper()<CR>

" Use :W (uppercase W) to save your files with 'sudo', usefull when you forget to open Vim
" with sudo to edit system files
command W w !sudo tee %

" Allow the match pairs operation (%) to work with '=' and ';' too (default is '(:),{:},[:]')
autocmd FileType c,cpp,h,java,js setlocal matchpairs+==:;

" Tricky stuff to put pointer the last place you were when you closed the file
set viminfo='100,\"1000,:40,%,n~/.viminfo
autocmd BufReadPost * if line("'\"")|execute("normal `\"")|endif
autocmd BufReadPost *
\   if line("'\"") > 0 && line("'\"") <= line("$") |
\       exe "normal g`\"" |
\   endif

" Section: Searching {{{2
set ignorecase          " Case insensitive searching
"set noignorecase       " Case sensitive searching
"set nohlsearch         " Disable highlight search occurences


" Section: Plugin Handling {{{1
" Install all plugins using vim-plug
" vim-plug usage:
"   PlugInstall [name ...]      Install plugins
"   PlugUpdate [name ...]       Install or update plugins
"   PlugClean[!]                Remove unused directories (bang version will clean without prompt)
"   PlugUpgrade                 Upgrade vim-plug itself
"   PlugStatus                  Check the status of plugins
"   PlugDiff                    Examine changes from the previous update and the pending changes
"   PlugSnapshot[!] [out path]  Generate script for restoring the current snapshot of the plugins

call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes

" Alternate Files quickly (.c --> .h etc) http://www.vim.org/scripts/script.php?script_id=31
Plug 'vim-scripts/a.vim'
" Function parameter complete, code snippets, and much more.
"  http://www.vim.org/scripts/script.php?script_id=1764
Plug 'vim-scripts/code_complete'
" cscope keyboard mappings for VIM
Plug 'chazy/cscope_maps'
" Simplify Doxygen documentation in C, C++, Python.
"  http://www.vim.org/scripts/script.php?script_id=987
Plug 'vim-scripts/DoxygenToolkit.vim'
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plugin to add tab bar (derived from miniBufExplorer)
"  http://www.vim.org/scripts/script.php?script_id=1338
Plug 'vim-scripts/TabBar'
" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
"  http://www.vim.org/scripts/script.php?script_id=273
Plug 'vim-scripts/taglist.vim'
" Vim bookmark plugin http://www.vim.org/scripts/script.php?script_id=4893
Plug 'MattesGroeger/vim-bookmarks'
" Automatically offers word completion as you type
"  http://www.vim.org/scripts/script.php?script_id=73
Plug 'vim-scripts/word_complete.vim'
" Generates config files for YouCompleteMe
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Add plugins to &runtimepath
call plug#end()

" Section: Keybinding {{{1

" Generate or update a cscope base including headers generated by dmtdd-platform
map <F1> :!cscope -bRkq -I ../../_build/builderenv/`pwd \| xargs basename`/`pwd \| xargs basename`-test-valgrind/imported/target/include/<CR>:!rm -f tags<CR>:!ctags -R --c-kinds=+p --fields=+S .<CR>:cs reset<CR>:TlistUpdate<CR>
" Deactivate indentation and other formatting stuff to prevent shit from happening while
" pasting things
set pastetoggle=<F2>
" Generate or update a cscope base
map <F3> :!cscope -bRkq<CR>:!rm -f tags<CR>:!ctags -R --c-kinds=+p --fields=+S .<CR>:cs reset<CR>:TlistUpdate<CR>
" Open/close Tag List
map <F4> :TlistToggle<CR>
" Open/close NERDTree navigator
map <F5> :NERDTreeToggle<CR>
" Comment a line
map <F6> :s/^\(.*\)$/\/\/\1/g<CR>:nohlsearch<CR>
" Un-comment a line
map <F7> :s/^\/\///g<CR>:nohlsearch<CR>
" Select a word
map s bve
" Select the entire buffer
map <C-a> ggVG
" Apply clang-format in the entire file
map <C-k> :%pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
imap <C-k> <c-o>:%pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
" Instert a generic debug function at current line
map <C-d> :call InsertDebugPrint()<CR>
imap <C-d> <c-o>:call InsertDebugPrint()<CR>
" Find occurrencys of debug function and remove them all
map <C-e> :%g/^\(.*\)printf("\(.*\)## %s:%d - %s()\(.*\)$/d<CR>
imap <C-e> <c-o>:%g/^\(.*\)printf("\(.*\)## %s:%d - %s()\(.*\)$/d<CR>
" Alternate between header and source file
map <TAB>a :A<CR>
" Open a Git Blame (or Shame?!) pane
map gb :call Gblame()<CR>

" Section: Cscope {{{2
" Go to next occurence of cscope search
map <C-g> :tn<CR>
" Go to previous occurence of cscope search
map <C-h> :tN<CR>
" Starts a find for a file
map <C-f> :cs find f 
" Starts an egrep find with cscope (conficts with remove print debug)
" map <C-e> :cs find e 

" Mapping cscope to use quickfix
"set cscopequickfix=s-,c-,d-,i-,t-,e-

" Section: Plugin settings {{{1
let g:bufExplorerUseCurrentWindow=1
let tlist_d_settings='c++;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function;c:class;T:template;p:abstract;X:mixin;m:member;M:module'
let tlist_htmljinja_settings='html;a:anchor;f:javascript function'

" Section: TagList {{{2
let g:Tlist_Sort_Type='name'
let g:Tlist_Auto_Highlight_Tag=1
let g:Tlist_Display_Prototype=0
let g:Tlist_Display_Tag_Scope=1
let g:Tlist_Compact_Format=1
let g:Tlist_Use_Right_Window=0
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=32
let g:Tlist_Enable_Fold_Column=0

" Section: NERDTree {{{2
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=0
let g:NERDTreeWinSize=40
let g:NERDTreeWinPos="left"

" Section: DoxygenToolkit {{{2
" Doxygen Toolkit (Change this to "Your Name <your.email@somecompany.foo>")
let g:DoxygenToolkit_authorName="Filipe Utzig <filipe.utzig@datacom.ind.br>"

" Section: Programming specific {{{1
" Section: YouCompleteMe {{{2
" Where to load YCM global config file
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" Do not ask when opening an extra conf file
let g:ycm_confirm_extra_conf = 0

" Section: C/C++ {{{2
" Where to load ctags file
set tags=tags,../tags,../../tags,../../../tags
set showfulltag         " Improve TAB completion in C/C++

" Add Doxygen code highlight support for C/C++ files
autocmd BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set syntax=cpp.doxygen

" Get username, format a debug printf() call, paste and indent
function! InsertDebugPrint()
    let cursor = getpos('.')
    let line = line('.')
    let username = system("whoami")
    let username = split(username, '\v\n')[0]
    let str = join(["printf(\"", " ## %s:%d - %s()\\n\", __FILE__, __LINE__, __func__);"], username)
    call append(line, str)
    let cursor[1] = cursor[1] + 1
    call setpos('.', cursor)
    normal ==
endfunction

" Before writing to C/C++/Python/Bash files, this function will remove any trailling space
function! RemoveTrailingSpaces()
    let save_cursor = getpos(".")
    :%s/\s*$//g
    ":'^
    :'.
    call setpos('.', save_cursor)
endfunction

autocmd BufWrite,FileWritePre
\   *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.py,*.sh
\   call RemoveTrailingSpaces()

" Before writing to C/C++ files, this function will remove any extra white lines end of a file
function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWrite,FileWritePre *.c,*.cc,*.cpp,*.h,*.hh,*.hpp call TrimEndLines()

" Before writing to C/C++ files, this function will format the file in clang-format defined
" by user in $HOME/.clang-format
function! FormatClangStyle()
    %pyf /usr/share/vim/addons/syntax/clang-format-3.5.py
endfunction

" autocmd BufWrite,FileWritePre *.c,*.cc,*.cpp,*.h,*.hh,*.hpp call FormatClangStyle()

" Section: Latex {{{2
" Template for document header
inoremap #document \documentclass[11pt]{article}<CR><CR>\usepackage[utf8]{inputenc}<CR>\usepackage[brazilian]{babel}<CR><CR>\title{}<CR>\author{}<CR>\date{}<CR>\begin{document}<CR>\maketitle<CR>\tableofcontents<CR>\abstract{}<CR><CR>\end{document}<UP>

" Template for itemize
inoremap #itemize \begin{itemize}<CR>\item<SPACE><CR>\end{itemize}

" Template for lists
inoremap #list \begin{lstlisting}<CR>\end{lstlisting}

" Section: GUI specific {{{1
" Section: Code highlight and colorscheme {{{2
" Fix syntax highlighting and set a colorscheme
"if exists("syntax_on")
"    syntax reset
"endif
"highlight clear
colorscheme gringolito

" Section: GUI Options {{{2
" Set window size of GVim when opening a new window
winsize 104 60

" Section: Fullscreen support {{{2
" Adds fullscreen support for GVim (mapped in F11)
" This script needs wmctrl to work properly (apt install wmctrl)
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

