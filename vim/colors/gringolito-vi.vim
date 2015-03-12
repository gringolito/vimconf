" Vim color file
" Name: devbox-dark-256
" Author: Dee Sub Wun

set background=light
set t_Co=256
let g:colors_name="gringolito-vi"

let python_highlight_all = 1
let c_gnu = 1

hi clear

if exists("syntax_on")
  syntax reset
endif

""""""
" COLOR DEFINITIONS
""""""""""""""""""""""""
hi Blue             cterm=NONE             ctermfg=81
hi Green            cterm=NONE             ctermfg=112
hi Grey             cterm=NONE             ctermfg=241
hi Orange           cterm=NONE             ctermfg=208
hi Purple           cterm=NONE             ctermfg=99
hi Purple2          cterm=NONE             ctermfg=93
hi Red              cterm=NONE             ctermfg=197
hi White            cterm=NONE             ctermfg=255
hi Yellow           cterm=NONE             ctermfg=11
hi BlueU            cterm=underline        ctermfg=81
hi GreyI            cterm=NONE             ctermfg=248
hi RedR             cterm=NONE             ctermbg=197
hi YellowR          cterm=NONE             ctermbg=222


""""""
" SYNTAX HIGHLIGHTING
""""""""""""""""""""""""
"hi Number           cterm=NONE              ctermfg=208         ctermbg=NONE
"hi Boolean          cterm=NONE              ctermfg=208         ctermbg=NONE

"hi Conditional      cterm=bold              ctermfg=149         ctermbg=NONE
"hi Repeat           cterm=bold              ctermfg=149         ctermbg=NONE
"hi Label            cterm=bold              ctermfg=149         ctermbg=NONE
"hi Keyword          cterm=bold              ctermfg=149         ctermbg=NONE
"hi Exception        cterm=NONE              ctermfg=170         ctermbg=NONE

"hi Include          cterm=NONE              ctermfg=170         ctermbg=NONE
"hi Define           cterm=NONE              ctermfg=170         ctermbg=NONE
"hi Macro            cterm=NONE              ctermfg=170         ctermbg=NONE
"hi PreCondit        cterm=NONE              ctermfg=170         ctermbg=NONE

"hi Structure        cterm=NONE              ctermfg=110         ctermbg=NONE
"hi Typedef          cterm=NONE              ctermfg=149         ctermbg=NONE

"hi SpecialChar      cterm=NONE              ctermfg=15          ctermbg=NONE
"hi Delimiter        cterm=NONE              ctermfg=15          ctermbg=NONE
"hi SpecialComment   cterm=NONE              ctermfg=15          ctermbg=NONE
"hi Debug            cterm=NONE              ctermfg=15          ctermbg=NONE

"hi xmlTagName       cterm=NONE              ctermfg=149         ctermbg=NONE
"hi xmlCdata         cterm=NONE              ctermfg=246         ctermbg=NONE
"hi xmlAttrib        cterm=NONE              ctermfg=110         ctermbg=NONE
"hi htmlTagName      cterm=NONE              ctermfg=149         ctermbg=NONE
"hi htmlArg          cterm=NONE              ctermfg=110         ctermbg=NONE
"hi htmlItalic       cterm=NONE              ctermfg=253         ctermbg=235


"hi Ignore           cterm=NONE              ctermfg=15          ctermbg=NONE



" Syntax highligh groups
hi! ColorColumn           ctermbg=240
hi! link Comment          GreyI
"
hi! link Constant         Purple
hi! link String           Yellow
hi! link Character        Yellow
"hi Number
"hi! link Boolean
hi! link Float            Purple2
"
hi! link Identifier       Blue
hi! link Function         Blue
"
hi! link Statement        Red
"hi Conditional
"hi Repeat
"hi Label
hi! link Operator         Green
"hi Keyword
"hi Exception
"
hi! link PreProc          Orange
"hi Include
"hi! link Define
"hi! link Macro           Red
"hi PreCondit
"
hi! link Type             Green
hi! link StorageClass     Red
"hi Structure
"hi Typedef
"
hi! link Special          Orange
"hi! link SpecialChar      Green
hi! link Tag              Green
"hi Delimiter
"hi SpecialComment
"hi Debug
"
hi! link Underlined       BlueU
"hi Ignore
hi! link Error            RedR
hi! link Todo             YellowR

" Language specific highligh groups
" C
hi link cStatement        Green
" C++
hi link cppStatement      Green
" CSS
hi link cssBraces               White
hi link cssFontProp             White
hi link cssColorProp            White
hi link cssTextProp             White
hi link cssBoxProp              White
hi link cssRenderProp           White
hi link cssAuralProp            White
hi link cssRenderProp           White
hi link cssGeneratedContentProp White
hi link cssPagingProp           White
hi link cssTableProp            White
hi link cssUIProp               White
hi link cssFontDescriptorProp   White
" Java
hi link javaStatement           Green
" Ruby
hi link rubyClassVariable       White
hi link rubyControl             Green
hi link rubyGlobalVariable      White
hi link rubyInstanceVariable    White

""""""
" INTERFACE
""""""""""""""""""""""""
"hi Cursor           cterm=NONE              ctermfg=white       ctermbg=red
"hi CursorLine       cterm=NONE              ctermfg=NONE        ctermbg=236
"hi CursorColumn     cterm=NONE              ctermfg=NONE        ctermbg=236
"hi Directory        cterm=NONE              ctermfg=149         ctermbg=NONE
"hi ErrorMsg         cterm=bold              ctermfg=15          ctermbg=9
"hi LineNr           cterm=NONE              ctermfg=245         ctermbg=238
"hi MatchParen       cterm=bold              ctermfg=0           ctermbg=149
"hi ModeMsg          cterm=NONE              ctermfg=15          ctermbg=NONE
"hi MoreMsg          cterm=NONE              ctermfg=149         ctermbg=NONE
"hi NonText          cterm=bold              ctermfg=239         ctermbg=NONE
hi Normal           cterm=NONE              ctermfg=255         ctermbg=236
"hi Question         cterm=NONE              ctermfg=149         ctermbg=NONE
"hi SpecialKey       cterm=NONE              ctermfg=149         ctermbg=NONE
"hi Title            cterm=NONE              ctermfg=170         ctermbg=NONE
"hi VertSplit        cterm=reverse           ctermfg=0           ctermbg=240
"hi WarningMsg       cterm=NONE              ctermfg=9           ctermbg=NONE
"hi WildMenu         cterm=NONE              ctermfg=15          ctermbg=236


""""""
" TABS
""""""""""""""""""""""""
"hi TabLine          cterm=bold,reverse      ctermfg=0           ctermbg=240
"hi TabLineFill      cterm=bold,reverse      ctermfg=0           ctermbg=240
"hi TabLineSel       cterm=bold,reverse      ctermfg=0           ctermbg=240


""""""
" COMPLETION
""""""""""""""""""""""""
"hi Pmenu            cterm=NONE              ctermfg=252         ctermbg=75
"hi PmenuSel         cterm=NONE              ctermfg=NONE        ctermbg=75


""""""
" STATUS
""""""""""""""""""""""""
"hi StatusLine       cterm=reverse           ctermfg=111         ctermbg=0
"hi StatusLineNC     cterm=reverse           ctermfg=238         ctermbg=245


""""""
" DIFF
""""""""""""""""""""""""
"hi DiffAdd          cterm=NONE              ctermfg=NONE        ctermbg=239
"hi DiffChange       cterm=NONE              ctermfg=NONE        ctermbg=170
"hi DiffDelete       cterm=bold              ctermfg=239         ctermbg=66
"hi DiffText         cterm=bold              ctermfg=15          ctermbg=NONE


""""""
" VISUAL
""""""""""""""""""""""""
"hi Visual           cterm=NONE              ctermfg=15          ctermbg=239
"hi VisualNOS        cterm=NONE              ctermfg=15          ctermbg=239


""""""
" FOLDING
""""""""""""""""""""""""
"hi Folded           cterm=NONE              ctermfg=244         ctermbg=235
"hi FoldColumn       cterm=NONE              ctermfg=15          ctermbg=237


""""""
" SEARCH
""""""""""""""""""""""""
"hi IncSearch        cterm=NONE              ctermfg=15          ctermbg=149
"hi Search           cterm=NONE              ctermfg=15          ctermbg=149


"vim: sw=4
