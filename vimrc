colorscheme limc 
" Get out of VI's compatible mode..
set nocompatible
" set up 256 color 
set t_Co=256
" syntax enable
syntax on
"
set nocscopeverbose
"plugin on
filetype plugin on
" Set map leader
let mapleader = ","
let g:mapleader = ","
"fast written
nmap <LEADER>w :w<CR>
nmap <LEADER>q :q<CR>
"
" <ESC> mapping to jj of InsertMode 
"
imap jj <ESC>
"set up comment color
"hi Normal ctermbg=000 ctermfg=white
hi comment guifg=black ctermfg=darkgray ctermbg=0
"this is for line number
set nu
"hi LineNr ctermfg=darkgray ctermbg=233 
" file encoding
set fenc=utf-8
set tenc=utf-8
set enc=utf-8
set fileencodings=utf-8,big5,cp950
set autoindent
set smartindent
filetype indent on
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead .tmux.conf*,tmux.conf* set filetype=tmux
"set tab 
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

function! s:setuptab()
set tabstop=8
set shiftwidth=2
set softtabstop=2
endfunction

autocmd FileType xml,html call s:setuptab()
autocmd FileType make setlocal noexpandtab
" set underline
function! s:InsertMode()
    set cursorline
endfunction

function! s:NotInsertMode()
    set nocursorline
endfunction

autocmd InsertLeave * call s:NotInsertMode()
autocmd InsertEnter * call s:InsertMode()

" set cmdline
set showcmd
set foldenable
set foldmethod=syntax 
set foldlevel=100
set foldcolumn=4
" xml fold
let g:xml_syntax_folding = 1
"hi FoldColumn ctermbg=black
nnoremap <SPACE> za
"""""""""""""""""""""""""""""""""
"    tabs
"""""""""""""""""""""""""""""""""
"
" Tab configuration
"
nmap <LEADER>tc :tabnew<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tk :tabclose<CR>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>
"
" Always show tab line
"
set showtabline=2
" Last used tab switching
autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction
nmap tt :call SwitchLastUsedTab()<CR>

set switchbuf=usetab

" Tab line format
function! TabLine()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let hiBG = ((i == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#')
        let winnr = tabpagewinnr(i, '$')
        "let filename = bufname(tabpagebuflist(i)[winnr - 1])
        let filename = bufname(tabpagebuflist(i)[0])
        if (filename == '')
            let filename = '=No Name='
        endif
        let s .= hiBG . ' '
        if (winnr > 1)
            let s .= '[' . i . '-' . winnr . '] '
        else
            let s .= '[' . i . '] '
        endif
        "let s .= substitute(filename, '.\+\/', '', 'g')
        let s .= filename
        let s .= (1 == gettabwinvar(i, 1, '&modified') ? '[+]' : '')
        let s .= ' '
        let i += 1
    exe | endfor
    let s .= '%#TabLineFill#'
    return s
endfunction
set tabline=%!TabLine()


"
"   tabs highlight
"
hi TabLine      cterm=NONE      ctermfg=fg      ctermbg=236
hi TabLineFill  cterm=NONE      ctermfg=fg      ctermbg=236
hi TabLineSel   cterm=NONE      ctermfg=fg      ctermbg=64
"""""""""""""""""""""""""""""""""""""""""
"set taglists
"""""""""""""""""""""""""""""""""""""""""
    " 自動更新目前的 tag 列表
    let Tlist_Auto_Update = 1
    
    " 顯示的 tag 排序方式：name/order
    let Tlist_Sort_Type = "name"
    
    " Tlist 視窗的寬度
    let Tlist_WinWidth = 30
    
    " 是否只顯示目前文件的 tag
    let Tlist_Show_One_File = 0
      " 關閉文件的同時，也關閉taglist視窗
    let Tlist_Exit_OnlyWindow = 1
    
    let Tlist_Use_SingleClick = 1
    
    " Tlist window at the right side
    let Tlist_Use_Right_Window = 1
    
    " Automatically close the folds for the non-active files
    let Tlist_File_Fold_Auto_Close = 1
    
    " Process files even when the taglist window is not open
    let Tlist_Process_File_Always = 1
    
    nnoremap <F5> :TlistToggle<CR>
""""""""""""
" Nerd Tree
"""""""""""
nnoremap <F6> :NERDTreeToggle<CR>
"
"  OmniCppComplete
"
map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
imap ,, -><C-X><C-O> 
set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
"
""" SrcExpl
"
nmap <F8> :SrcExplToggle<CR>

"
let g:SrcExpl_refreshTime = 500 
" // Set 'Enter' key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set '' key for back from the definition context 
let g:SrcExpl_gobackKey = "<LEADER>b"
let g:SrcExpl_isUpdateTags = 0 
"
"
" cscope
map <F9> :!cscope -Rbkq<CR>
" CCtree
let g:CCTreeCscopeDb = "cscope.out"

"" AutoClose
inoremap {<CR>   {<CR>}<ESC>O
inoremap [   []<ESC>i
inoremap (   ()<ESC>i
inoremap '   ''<ESC>i
inoremap "   ""<ESC>i

"" Tabularize
nmap <LEADER>a= :Tabularize /=<CR>
vmap <LEADER>a= :Tabularize /=<CR>
nmap <LEADER>a: :Tabularize /:\zs<CR>
vmap <LEADER>a: :Tabularize /:\zs<CR>
