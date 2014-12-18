" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 14

" This color scheme uses a dark grey background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "limc"

hi Normal ctermbg=000 ctermfg=white
" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
"hi Visual term=reverse ctermbg=black guibg=grey60
hi Visual term=reverse cterm=reverse ctermbg=black guibg=grey60
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
"hi Cursor guibg=Green guifg=Black
"hi lCursor guibg=Cyan guifg=Black
hi Directory term=bold ctermfg=LightCyan guifg=Cyan
hi LineNr term=underline ctermfg=darkgray ctermbg=233
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=LightBlue gui=bold guifg=LightBlue guibg=grey30
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi SpecialKey term=bold ctermfg=LightBlue guifg=Cyan
hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=LightRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=233 ctermfg=darkgray guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=black ctermfg=darkgray guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan
hi CursorColumn term=reverse ctermbg=Black guibg=grey40
hi CursorLine term=bold cterm=underline guibg=grey40
hi Name ctermbg=000 ctermfg=150
" Highlight for ShowMarks
hi SignColumn   ctermfg=darkgray ctermbg=233 cterm=bold term=underline 
hi ShowMarksHLl ctermfg=darkgray ctermbg=233 cterm=bold guifg=blue guibg=lightblue gui=bold
hi ShowMarksHLu ctermfg=darkgray ctermbg=233 cterm=bold guifg=blue guibg=lightblue gui=bold
hi ShowMarksHLo ctermfg=darkgray ctermbg=233 cterm=bold guifg=blue guibg=lightblue gui=bold
hi ShowMarksHLm ctermfg=darkgray ctermbg=233 cterm=bold guifg=blue guibg=lightblue gui=bold

" Groups for syntax highlighting
hi String term=underline ctermfg=166 ctermbg=233
hi Constant term=underline ctermfg=Magenta guifg=#ffa0a0 guibg=grey5
hi Special term=bold ctermfg=LightRed guifg=Orange guibg=grey5
"hi Function ctermfg=blue 
hi Function ctermfg=110
hi StdFunction	ctermfg=166 gui=bold guifg=#e86f00
hi Operator ctermfg=green
if &t_Co > 8
  hi Statement term=bold cterm=bold ctermfg=Yellow guifg=#ffff60 gui=bold
endif
hi Ignore ctermfg=DarkGrey guifg=grey20

" vim: sw=2
"
hi CCTreeHiSymbol  gui=bold guifg=yellow guibg=darkblue ctermfg=yellow ctermbg=darkblue
hi CCTreeHiMarkers  gui=bold guifg=yellow guibg=darkblue ctermfg=yellow ctermbg=darkblue
hi Ignore ctermfg=black guifg=bg
