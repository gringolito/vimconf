" Rafael Zalamena <rzalamena@gmail.com> - vim configuration
" Custom settings
set nocompatible
set backspace=indent,eol,start

" enconding stuff
set termencoding=utf8
set encoding=utf8
try
	lang en_US
	catch
endtry

" spelling stuff
set nospell
set spl=en_US
set ve=block

" misc
set title
set ruler " always display the cursos current position

" ident
set background=dark
set tags=tags,../tags,../../tags,../../../tags
set tabstop=8     " (ts) width (in spaces) that a <tab> is displayed as
set softtabstop=8 " (sts) makes spaces feel like tabs (like deleting)
set shiftwidth=8  " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
set autoindent    " (ai) turn on auto-indenting (great for programers)
set copyindent    " (ci) when auto-indenting, use the indenting format of the previous line
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs
set noexpandtab   " why the hell would i want space instead of tabs

" cool stuff
colorscheme gringolito " color scheme pack installed, see ~/.vim/colors
filetype on
filetype plugin on
syn on			" syntax highlight
set number		" line numbers
set wmnu		" wild menu - cool stuff
set wildmode=longest,list:full
set hi=5000		" hostory size
set hidden		" dont unload buffer on window close
set encoding=utf-8
set list		" show hidden characters like tabs and lost spaces
set listchars=tab:▸\    "
set listchars+=trail:·  " whats gonna be shown instead of those specified stuff
set completeopt=menu,menuone,preview " completion stuff
set incsearch		" search as im typing - damn good
set ignorecase		" ignore case
set showfulltag		" C stuff
set hlsearch		" highlight search occurences
set tabpagemax=100	" max tabs
set cursorline		" highlight cursor line
set splitright		" split panel in right side
" tricky stuff to put pointer the last place you were when you closed the file
set viminfo='100,\"1000,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" file specific
"set tw=72
au FileType Mail set fo=ctq tw=72 et      " respect the netiquette while mailing
au FileType c,h,java,js setlocal mps+==:; " allow the match pairs operation (%) to work with '=' and ';'
" deactivate indentation and other formatting stuff to prevent
" shit from happening while pasting things
set pastetoggle=<F2>

set makeprg=makegvim\ --directory=~/Projects/buildroot

" plugins bindings
map <F1> :bd<CR><CR>:syntax on<CR>
map <F3> :!cscope -bRkq<CR>:!rm -f tags<CR>:!ctags -R --c-kinds=+p --fields=+S .<CR>:cs reset<CR>:TlistUpdate<CR>
map <F4> :TlistToggle<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :s/^\(.*\)$/\/\/\1/g<CR>:nohlsearch<CR>
map <F7> :s/^\/\///g<CR>:nohlsearch<CR>
map s bve
map <C-g> :tn<CR>
map <C-h> :tN<CR>
map <C-f> :cs find f 
map <C-e> :cs find e 
map <C-k> :make
map <C-Down> :cn<CR>
map <C-Up> :cN<CR>

" plugin settings
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

let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=0
let g:NERDTreeWinSize=40
let g:NERDTreeWinPos="left"
let g:bufExplorerUseCurrentWindow=1

let tlist_d_settings='c++;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function;c:class;T:template;p:abstract;X:mixin;m:member;M:module'
let tlist_htmljinja_settings='html;a:anchor;f:javascript function'

" misc stuff
map <TAB>s :A<CR>
map <TAB>n :tabn<CR>
map <TAB>p :tabp<CR>
"inoremap <SPACE><TAB> <TAB>

" inoremapping, easen stuff
" my latex stuff
inoremap #document \documentclass[11pt]{article}<CR><CR>\usepackage[utf8]{inputenc}<CR>\usepackage[brazilian]{babel}<CR><CR>\title{}<CR>\author{}<CR>\date{}<CR>\begin{document}<CR>\maketitle<CR>\tableofcontents<CR>\abstract{}<CR><CR>\end{document}<UP>
inoremap #itemize \begin{itemize}<CR>\item<SPACE><CR>\end{itemize}
inoremap #list \begin{lstlisting}<CR>\end{lstlisting}

" Doxygen Toolkit
let g:DoxygenToolkit_authorName="Filipe Utzig <futzig@parks.com.br>"

"good tab completion - press <tab> to autocomplete if there's a character
""previously
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Removes superfluous white space from the end of a line
"function! RemoveWhiteSpace()
"    :%s/\s*$//g
"    :'^
"    "`.
"endfunction

" before writing to any file, this function call will remove any extra white space at the end of a line
"au! BufWrite,FileWritePre * call RemoveWhiteSpace()

command W w !sudo tee %
