" Vim color file
" Maintainer:  Damien Gombault <desintegr@gmail.com>
" WWW:         http://desintegr.googlecode.com/svn/config/vim/colors/monokai.vim
" Last Change: 2008 Feb 27
" Version:     0.1.3

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "gringolito"

" Highlight all function names
highlight def link cCustomFunc Function

" Color groups
hi Yellow1  guifg=#FCE94F gui=none
hi Yellow2  guifg=#EDD400 gui=none
hi Yellow3  guifg=#C4A000 gui=none
hi Orange1  guifg=#FCAF3E gui=none
hi Orange2  guifg=#F57900 gui=none
hi Orange3  guifg=#CE5C00 gui=none
hi Brown1   guifg=#E9B99E gui=none
hi Brown2   guifg=#C17D11 gui=none
hi Brown3   guifg=#8F5902 gui=none
hi Green1   guifg=#8AE234 gui=none
hi Green2   guifg=#73D216 gui=none
hi Green3   guifg=#4E9A06 gui=none
hi Blue1    guifg=#729FCF gui=none
hi Blue2    guifg=#3465A4 gui=none
hi Blue3    guifg=#204A87 gui=none
hi Purple1  guifg=#AD7FA8 gui=none
hi Purple2  guifg=#75507B gui=none
hi Purple3  guifg=#5C3566 gui=none
hi Red1     guifg=#EF2929 gui=none
hi Red2     guifg=#CC0000 gui=none
hi Red3     guifg=#A40000 gui=none
hi White    guifg=#EEEEEC gui=none
hi Grey1    guifg=#D3D7CF gui=none
hi Grey2    guifg=#BABDB6 gui=none
hi Grey3    guifg=#888A85 gui=none
hi Grey4    guifg=#555753 gui=none
hi Black    guifg=#2E3436 gui=none

hi BlueU    guifg=#729FCF gui=underline

hi GreyI    guifg=#888A85 gui=italic

hi RedR     guifg=fg guibg=#CC0000 gui=none
hi YellowR  guifg=bg guibg=#FCE94F gui=none
hi Normal   guifg=#EEEEEC guibg=#2E3436

" Main highlight groups
hi Cursor       guibg=fg
"hi CursorIM
"hi CursorColumn
hi CursorLine   guibg=#2E3436
hi Directory    guifg=#66D9EF gui=none
hi DiffAdd      guifg=bg guibg=#A6E22E
hi DiffChange   guifg=bg guibg=#E6DB74
hi DiffDelete   guifg=bg guibg=#F92672
hi DiffText     guifg=bg guibg=#E6DB74
hi ErrorMsg     guifg=#F92672 guibg=bg gui=none
hi VertSplit    guifg=#3B3A32 guibg=bg gui=none
hi Folded       guifg=#75715E guibg=bg gui=none
hi FoldColumn   guifg=#75715E guibg=#2E3436 gui=none
hi SignColum    guifg=#75715E guibg=#2E3436 gui=none
hi IncSearch    guifg=bg guibg=#D3D7CF gui=none
hi LineNr       guifg=#75715E guibg=#2E3436 gui=none
hi MatchParen   guifg=#56C9FF guibg=bg gui=bold,italic
hi ModeMsg      guifg=#FD971F gui=none
hi MoreMsg      guifg=#66D9EF gui=none
hi NonText      guifg=#3B3A32 gui=none
hi Pmenu        guifg=fg guibg=#3E3D32
hi PmenuSel     guifg=fg guibg=bg
hi PmenuSbar    guibg=bg
hi PmenuThumb   guifg=fg
hi Question     guifg=#A6E22E gui=none
hi Search       guifg=bg guibg=#E6DB74 gui=none
hi SpecialKey   guifg=#737260 gui=none
hi SpellBad     guisp=#F92672
hi SpellCap     guisp=#65D9EF
"hi SpellLocal
hi SpellRare    guisp=#AE81FF
hi StatusLine   guifg=fg guibg=#3E3D32 gui=none
hi StatusLineNC guifg=#75715E guibg=#3E3D32 gui=none
hi String       guifg=#75715E guibg=#3E3D32 gui=none
hi TabLine      guifg=#75715E guibg=#3E3D32 gui=none
hi TabLineFill  guifg=fg guibg=#3E3D32 gui=none
hi TabLineSel   guifg=fg guibg=#3E3D32 gui=none
hi Title        guifg=#F92672 gui=none
hi Visual       guibg=#49483E gui=none
"hi VisualNOS
hi WarningMsg   guifg=#F92672 gui=none
"hi WildMenu

"hi Menu
"hi ScrollBar
"hi Tooltip

" Plugin specific highlight groups
hi MyTagListFileName guifg=#FD971F guibg=bg gui=none

" Syntax highligh groups
hi! ColorColumn guibg=#3E3D32
hi! link Comment      GreyI
"
hi! link Constant     Purple1
hi! link String       Yellow1
hi! link Character    Yellow1
"hi Number
"hi! link Boolean
hi! link Float        Purple2
"
hi! link Identifier   Blue1
hi! link Function     Blue1
"
hi! link Statement    Red1
"hi Conditional
"hi Repeat
"hi Label
hi! link Operator     Green1
"hi Keyword
"hi Exception
"
hi! link PreProc      Orange2
"hi Include
"hi! link Define
"hi! link Macro        Red
"hi PreCondit
"
hi! link Type         Green2
hi! link StorageClass Red1
"hi Structure
"hi Typedef
"
hi! link Special      Orange1
"hi! link SpecialChar  Green
hi! link Tag          Green2
"hi Delimiter
"hi SpecialComment
"hi Debug
"
hi! link Underlined   BlueU
"hi Ignore
hi! link Error        RedR
hi! link Todo         YellowR

" Language specific highligh groups
" C
hi link cStatement    Green2
" C++
hi link cppStatement  Green2
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
hi link javaStatement           Green2
" Ruby
hi link rubyClassVariable       White
hi link rubyControl             Green2
hi link rubyGlobalVariable      White
hi link rubyInstanceVariable    White
