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
set title               " Change the window title to 'filename [++-] (path) - VIM'
set ruler               " Display the cursos current position
set hidden              " Don't unload buffer on window close
"set nohidden           " Unload buffer when window close, save a bit of memory, but is slower
set splitright          " When spliting panel, the new one will be in right side
set clipboard=unnamed   " Keep a single clipboard between all your vim sessions
set autowrite           " Automatically save before :next, :make etc.

" Remember things between sessions
" '20  - remember marks for 20 previous files
" <50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
if has("nvim")
    set shada='20,<50,:20,%,n~/.nviminfo
endif

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
set tabstop=8           " Width (in spaces) that a <tab> is displayed as
set softtabstop=8       " Makes spaces feel like tabs (like deleting)
set shiftwidth=8        " Width (in spaces) used in each step of autoindent (aswell as << and >>)
set copyindent          " When auto-indenting, use the indenting format of the previous line
set smartindent         " Does the right thing (mostly) in programs
set noexpandtab         " Why the hell would I want space instead of tabs
"set expandtab          " If you need to use spaces instead tabs
set nobackup            " Do not create backup files
set noswapfile          " Do not create swap files

" Section: Cool stuff {{{1
" Enable block editing support (type Ctrl+V in normal-mode to start block selection)
set virtualedit=block

set number              " Show line numbers on left
set cursorline          " Highlight current line
"set nocursorline       " Disable current line highlighting
set colorcolumn=100     " Set horizontal ruler indicator size (in columns)
"set textwidth=100      " Automatic broke line after size (in columns)
set list                " Show hidden characters like tabs and lost spaces
set listchars=nbsp:+    " Initialize listchars
set listchars+=tab:▸\   " Whats gonna be shown instead of TABs
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
function! Smart_TabComplete()
  let line = getline('.')                         " current line
  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <TAB> <C-r>=Smart_TabComplete()<CR>

" Use :W (uppercase W) to save your files with 'sudo', useful when you forget to open Vim
" with sudo to edit system files
command! W w !sudo tee %

" Allow the match pairs operation (%) to work with '=' and ';' too (default is '(:),{:},[:]')
autocmd FileType c,cpp,h,go,py,java,js setlocal matchpairs+==:;

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
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'
" fugitive.vim: a Git wrapper so awesome, it should be illegal
"  http://www.vim.org/scripts/script.php?script_id=2975
Plug 'tpope/vim-fugitive'
" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
" Extends RST syntax file to support embedded Robot Framework code
Plug 'evedovelli/rst-robotframework-syntax-vim'
" autopep8 automatically formats Python code to conform to the PEP 8 style guide.
Plug 'tell-k/vim-autopep8'
" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Add plugins to &runtimepath
call plug#end()

" Section: Keybinding {{{1
" Map the leader key to SPACE
"let mapleader="\<SPACE>"

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
"Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Deactivate indentation and other formatting stuff to prevent shit from happening while
" pasting things
set pastetoggle=<F2>
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
" Alternate between header and source file
map <TAB>a :A<CR>
" Open a Git Blame (or Shame?!) pane
map gb :call Gblame()<CR>

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

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
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Section: Plugin settings {{{1
let g:bufExplorerUseCurrentWindow=1

" Section: airline {{{2
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 2
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme= 'wombat'

" Section: TagList {{{2
let tlist_d_settings='c++;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function;c:class;T:template;p:abstract;X:mixin;m:member;M:module'
let tlist_htmljinja_settings='html;a:anchor;f:javascript function'
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
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
let g:DoxygenToolkit_paramTag_pre = "\\param "
let g:DoxygenToolkit_returnTag = "\\return "
let g:DoxygenToolkit_throwTag_pre = "\\throw "
let g:DoxygenToolkit_fileTag = "\\file "
let g:DoxygenToolkit_authorTag = "\\author "
let g:DoxygenToolkit_dateTag = "\\date "
let g:DoxygenToolkit_versionTag = "\\version "
let g:DoxygenToolkit_blockTag = "\\name "
let g:DoxygenToolkit_classTag = "\\class "
let g:DoxygenToolkit_compactOneLineDoc = "yes"
let g:DoxygenToolkit_compactDoc = "yes"

" Section: AutoPep8 {{{2
" Do not fix these errors/warnings (default: E226,E24,W6)
"let g:autopep8_ignore="E501,W293"

" Fix only these errors/warnings (e.g. E4,W)
"let g:autopep8_select="E501,W293"

" Maximum number of additional pep8 passes (default: 100)
"let g:autopep8_pep8_passes=100

" Set maximum allowed line length (default: 79)
let g:autopep8_max_line_length=100

" Enable possibly unsafe changes (E711, E712) (default: non defined)
"  add aggressive option (--aggressive)
"let g:autopep8_aggressive=1
"  add more aggressive options (--aggressive --aggressive)
let g:autopep8_aggressive=2

" Number of spaces per indent level (default: 4)
"let g:autopep8_indent_size=2

" Disable show diff window
"let g:autopep8_disable_show_diff=1

" Chose diff window type. (default: horizontal)
let g:autopep8_diff_type='vertical'

" Section: Programming specific {{{1
" Section: YouCompleteMe {{{2
" Where to load YCM global config file
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" Do not ask when opening an extra conf file
let g:ycm_confirm_extra_conf = 0

" Section: C/C++ {{{2

" Fix formatting stuff for C/C++ files
augroup c_cpp
    autocmd!
    autocmd FileType c,cpp,h set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType c,cpp,h set cindent             " Stricter rules for C programs
    " Where to load ctags file
    autocmd FileType c,cpp,h set tags=tags,../tags,../../tags,../../../tags
    " Improve TAB completion in C/C++
    autocmd FileType c,cpp,h set showfulltag
    " Generate or update a cscope base including headers generated by dmtdd-platform
    autocmd FileType c,cpp,h map <F1> :!cscope -bRkq -I ../../_build/builderenv/`pwd \| xargs basename`/`pwd \| xargs basename`-test-valgrind/imported/target/include/<CR>:!rm -f tags<CR>:!ctags -R --c-kinds=+p --fields=+S .<CR>:cs reset<CR>:TlistUpdate<CR>
    " Generate or update a cscope base
    autocmd FileType c,cpp,h map <F3> :!cscope -bRkq<CR>:!rm -f tags<CR>:!ctags -R --c-kinds=+p --fields=+S .<CR>:cs reset<CR>:TlistUpdate<CR>
    " Apply clang-format in the entire file
    autocmd FileType c,cpp,h map <C-k> :%pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
    autocmd FileType c,cpp,h imap <C-k> <c-o>:%pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
    " Instert a generic debug function at current line
    autocmd FileType c,cpp,h map <C-d> :call InsertDebugPrint()<CR>
    autocmd FileType c,cpp,h imap <C-d> <c-o>:call InsertDebugPrint()<CR>
    " Find occurrencys of debug function and remove them all
    autocmd FileType c,cpp,h map <C-e> :%g/^\(.*\)printf("\(.*\)## %s:%d - %s()\(.*\)$/d<CR>
    ")
    autocmd FileType c,cpp,h imap <C-e> <c-o>:%g/^\(.*\)printf("\(.*\)## %s:%d - %s()\(.*\)$/d<CR>
augroup END

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

" Section: Go {{{2 
" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
    autocmd!
    " Show by default 4 spaces for a tab
    autocmd FileType go set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
    " :GoBuild and :GoTestCompile
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    " :GoTest
    autocmd FileType go nmap <leader>t  <Plug>(go-test)
    " :GoRun
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    " :GoDoc
    autocmd FileType go nmap <Leader>d <Plug>(go-doc)
    " :GoCoverageToggle
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
    " :GoInstall
    autocmd FileType go nmap <Leader>i <Plug>(go-install)
    " :GoMetaLinter
    autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
    " :GoDef but opens in a vertical split
    autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
    " :GoDef but opens in a horizontal split
    autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
    " :GoAlternate  commands :A, :AV, :AS and :AT
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Section: Latex {{{2
" Template for document header
inoremap #document \documentclass[11pt]{article}<CR><CR>\usepackage[utf8]{inputenc}<CR>\usepackage[brazilian]{babel}<CR><CR>\title{}<CR>\author{}<CR>\date{}<CR>\begin{document}<CR>\maketitle<CR>\tableofcontents<CR>\abstract{}<CR><CR>\end{document}<UP>

" Template for itemize
inoremap #itemize \begin{itemize}<CR>\item<SPACE><CR>\end{itemize}

" Template for lists
inoremap #list \begin{lstlisting}<CR>\end{lstlisting}

" Section: Python {{{2
" Configure = to autopep8
autocmd FileType python set equalprg=autopep8\ -

" Apply autopep8 on file
autocmd FileType python noremap <buffer> <C-k> :call Autopep8()<CR>

