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

hi Normal       guifg=#F8F8F2 guibg=#272822

" Main highlight groups
hi Cursor       guibg=fg
"hi CursorIM
"hi CursorColumn
hi CursorLine   guibg=#3E3D32
hi Directory    guifg=#66D9EF gui=none
hi DiffAdd      guifg=bg guibg=#A6E22E
hi DiffChange   guifg=bg guibg=#E6DB74
hi DiffDelete   guifg=bg guibg=#F92672
hi DiffText     guifg=bg guibg=#E6DB74
hi ErrorMsg     guifg=#F92672 guibg=bg gui=none
hi VertSplit    guifg=#3B3A32 guibg=bg gui=none
hi Folded       guifg=#75715E guibg=bg gui=none
hi FoldColumn   guifg=#75715E guibg=#3E3D32 gui=none
hi SignColum    guifg=#75715E guibg=#3E3D32 gui=none
hi IncSearch    guifg=bg guibg=#E6DB74 gui=none
hi LineNr       guifg=#75715E guibg=#3E3D32 gui=none
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


" Color groups
hi Blue    guifg=#66D9EF gui=none
hi Green   guifg=#A6E22E gui=none
hi Grey    guifg=#85817E gui=none
hi Orange  guifg=#FD971F gui=none
hi Purple  guifg=#AA7DE9 gui=none
hi Purple2 guifg=#7881FF gui=none
hi Red     guifg=#FF2652 gui=none
hi White   guifg=#F8F8F2 gui=none
hi Yellow  guifg=#E6DB54 gui=none

hi BlueU   guifg=#66D9EF gui=underline

hi GreyI    guifg=#908C80 gui=italic

hi RedR    guifg=fg guibg=#F92672 gui=none
hi YellowR guifg=bg guibg=#FD971F gui=none


" Syntax highligh groups
hi! ColorColumn guibg=#3E3D32
hi! link Comment      GreyI
"
hi! link Constant     Purple
hi! link String       Yellow
hi! link Character    Yellow
"hi Number
"hi! link Boolean
hi! link Float        Purple2
"
hi! link Identifier   Blue
hi! link Function     Blue
"
hi! link Statement    Red
"hi Conditional
"hi Repeat
"hi Label
hi! link Operator     Green
"hi Keyword
"hi Exception
"
hi! link PreProc      Orange
"hi Include
"hi! link Define
"hi! link Macro        Red
"hi PreCondit
"
hi! link Type         Green
hi! link StorageClass Red
"hi Structure
"hi Typedef
"
hi! link Special      Orange
"hi! link SpecialChar  Green
hi! link Tag          Green
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
hi link cStatement              Green
" C++
hi link cppStatement            Green
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
