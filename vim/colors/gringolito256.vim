" Vim color file
" Name: gringolito256
" Author: Filipe Utzig

set background=light
set t_Co=256
let g:colors_name="gringolito256"

let python_highlight_all = 1
let c_gnu = 1

hi clear

if exists("syntax_on")
  syntax reset
endif

""""""
" COLOR DEFINITIONS
""""""""""""""""""""""""
hi Blue             cterm=none             ctermfg=81           ctermbg=none
hi BlueU            cterm=underline        ctermfg=81           ctermbg=none
hi Green            cterm=none             ctermfg=112          ctermbg=none
hi Grey             cterm=none             ctermfg=241          ctermbg=none
hi Grey2            cterm=none             ctermfg=59           ctermbg=none
hi GreyR            cterm=none             ctermfg=none         ctermbg=238
hi DarkGreyR        cterm=none             ctermfg=none         ctermbg=236
hi LightGrey        cterm=none             ctermfg=248          ctermbg=none
hi Orange           cterm=none             ctermfg=208          ctermbg=none
hi Purple           cterm=none             ctermfg=99           ctermbg=none
hi Purple2          cterm=none             ctermfg=93           ctermbg=none
hi Red              cterm=none             ctermfg=197          ctermbg=none
hi RedR             cterm=none             ctermfg=none         ctermbg=197
hi Pink             cterm=none             ctermfg=162          ctermbg=none
hi White            cterm=none             ctermfg=255          ctermbg=none
hi Yellow           cterm=none             ctermfg=11           ctermbg=none
hi YellowR          cterm=none             ctermfg=none         ctermbg=208


""""""
" SYNTAX HIGHLIGHTING
""""""""""""""""""""""""
"hi Number           cterm=none              ctermfg=208         ctermbg=none
"hi Boolean          cterm=none              ctermfg=208         ctermbg=none

"hi Conditional      cterm=bold              ctermfg=149         ctermbg=none
"hi Repeat           cterm=bold              ctermfg=149         ctermbg=none
"hi Label            cterm=bold              ctermfg=149         ctermbg=none
"hi Keyword          cterm=bold              ctermfg=149         ctermbg=none
"hi Exception        cterm=none              ctermfg=170         ctermbg=none

"hi Include          cterm=none              ctermfg=170         ctermbg=none
"hi Define           cterm=none              ctermfg=170         ctermbg=none
"hi Macro            cterm=none              ctermfg=170         ctermbg=none
"hi PreCondit        cterm=none              ctermfg=170         ctermbg=none

"hi Structure        cterm=none              ctermfg=110         ctermbg=none
"hi Typedef          cterm=none              ctermfg=149         ctermbg=none

"hi SpecialChar      cterm=none              ctermfg=15          ctermbg=none
"hi Delimiter        cterm=none              ctermfg=15          ctermbg=none
"hi SpecialComment   cterm=none              ctermfg=15          ctermbg=none
"hi Debug            cterm=none              ctermfg=15          ctermbg=none

"hi xmlTagName       cterm=none              ctermfg=149         ctermbg=none
"hi xmlCdata         cterm=none              ctermfg=246         ctermbg=none
"hi xmlAttrib        cterm=none              ctermfg=110         ctermbg=none
"hi htmlTagName      cterm=none              ctermfg=149         ctermbg=none
"hi htmlArg          cterm=none              ctermfg=110         ctermbg=none
"hi htmlItalic       cterm=none              ctermfg=253         ctermbg=235

"hi Ignore           cterm=none              ctermfg=15          ctermbg=none


" Syntax highligh groups
hi! link Comment          LightGrey
"
hi! link Constant         Purple
hi! link String           Yellow
hi! link Character        Yellow
hi! link Float            Purple2
"
hi! link Identifier       Blue
hi! link Function         Blue
"
hi! link Statement        Red
hi! link Operator         Green
"
hi! link PreProc          Orange
"
hi! link Type             Green
hi! link StorageClass     Red
"
hi! link Special          Orange
hi! link Tag              Green
"
hi! link Underlined       BlueU
hi! link Error            RedR
hi! link Todo             YellowR

" Language specific highligh groups
" C
hi! link cStatement              Green
" Highlight all function names
hi! def link cCustomFunc         Function
" C++
hi! link cppStatement            Green
" CSS
hi! link cssBraces               White
hi! link cssFontProp             White
hi! link cssColorProp            White
hi! link cssTextProp             White
hi! link cssBoxProp              White
hi! link cssRenderProp           White
hi! link cssAuralProp            White
hi! link cssRenderProp           White
hi! link cssGeneratedContentProp White
hi! link cssPagingProp           White
hi! link cssTableProp            White
hi! link cssUIProp               White
hi! link cssFontDescriptorProp   White
" Java
hi! link javaStatement           Green
" Ruby
hi! link rubyClassVariable       White
hi! link rubyControl             Green
hi! link rubyGlobalVariable      White
hi! link rubyInstanceVariable    White

""""""
" INTERFACE
""""""""""""""""""""""""
"hi! Cursor              cterm=none              ctermfg=none    ctermbg=fg
hi! link CursorLine     DarkGreyR
hi! link ColorColumn    DarkGreyR
hi! link Directory      Blue
hi! link ErrorMsg       Red
hi! LineNr              cterm=none              ctermfg=245     ctermbg=236
hi! MatchParen          cterm=bold,italic       ctermfg=81      ctermbg=none
hi! link ModeMsg        Orange
hi! link MoreMsg        Blue
hi! link NonText        Grey
hi! Normal              cterm=none              ctermfg=white   ctermbg=234
hi! link Question       Green
hi! link SpecialKey     Grey2
hi! link Title          Pink
hi! link VertSplit      Grey
hi! link WarningMsg     Pink
"hi! WildMenu         cterm=none                 ctermfg=15      ctermbg=236


""""""
" TABS
""""""""""""""""""""""""
hi! TabLine             cterm=none              ctermfg=59      ctermbg=236
hi! link TabLineFill    DarkGreyR
hi! link TabLineSel     DarkGreyR


""""""
" COMPLETION
""""""""""""""""""""""""
hi! link Pmenu          DarkGreyR
"hi! link PmenuSel         cterm=none              ctermfg=none        ctermbg=75
"hi! link PmenuSbar
"hi! link PmenuThumb

""""""
" STATUS
""""""""""""""""""""""""
hi! link StatusLine     DarkGreyR
hi! StatusLineNC        cterm=none              ctermfg=59      ctermbg=236


""""""
" DIFF
""""""""""""""""""""""""
hi! DiffAdd             cterm=none              ctermfg=bg      ctermbg=148
hi! DiffChange          cterm=none              ctermfg=bg      ctermbg=185
hi! DiffDelete          cterm=bold              ctermfg=bg      ctermbg=197
hi! DiffText            cterm=bold              ctermfg=bg      ctermbg=185


""""""
" VISUAL
""""""""""""""""""""""""
hi! link Visual         GreyR
"hi! VisualNOS        cterm=none              ctermfg=15          ctermbg=239


""""""
" FOLDING
""""""""""""""""""""""""
hi! Folded              cterm=none              ctermfg=59      ctermbg=none
hi! FoldColumn          cterm=none              ctermfg=59      ctermbg=236
hi! link SignColum      FoldColumn


""""""
" SEARCH
""""""""""""""""""""""""
hi! IncSearch           cterm=none              ctermfg=bg      ctermbg=11
hi! link Search         IncSearch


""""""
" SPELL
""""""""""""""""""""""""
"hi! SpellBad     guisp=#F92672
"hi! SpellCap     guisp=#65D9EF
"hi! SpellLocal
"hi! SpellRare    guisp=#AE81FF

"vim: sw=4
