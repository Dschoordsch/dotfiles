call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype off
filetype plugin on
set nocompatible
  
"disable noise
set noeb vb t_vb=
set vb t_vb=

"bash like file open
set wildmode=longest,list,full
set wildmenu

"diff
nnoremap ,u :diffupdate<cr>
nnoremap ,g :diffget<cr>
nnoremap ,p :diffput<cr>

"search
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap // :noh<cr>

"menus
set guioptions=aegit
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

set mouse=a " enable mouse, also in terminal
set mousemodel=popup

" Show symbols in open buffers
nnoremap <F1> :TlistToggle<CR>

" Folding
"augroup vimrc
  "au BufReadPre * setlocal foldmethod=indent
  "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
set foldmethod=marker
set foldminlines=3
"set foldopen=all
set autochdir

map <Leader>/ :call ToggleCommentify()<CR>
imap <M-c> <ESC>:call ToggleCommentify()<CR>j

"appeareance
color candycode
set guifont=DejaVu\ sans\ mono\ 8
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
set number
syntax on
set cindent
set equalprg="astyle --options=~/AutoAuto/current/artistic.style"
set backspace=2 " allow backspacing over everything in insert mode 
set tabstop=4 " how many columns are one tab
set shiftwidth=4 " how many columns will be indented when using >>, << or C-style
set softtabstop=4 " how many columns will code be intended, combines tabs and spaces
" set expandtab
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent

" lhs comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ," :s/^/\"/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/autoauto
"set tags+=~/.vim/tags/* , no wildcards, therefore manually: for X in ~/.vim/tags/* ; do echo -n $X,; done;
"set tags=/home/dschoordsch/.vim/tags/boost,/home/dschoordsch/.vim/tags/eigen3,/home/dschoordsch/.vim/tags/opencv,/home/dschoordsch/.vim/tags/qt,/home/dschoordsch/.vim/tags/rtt,/home/dschoordsch/.vim/tags/stdlib.h,/home/dschoordsch/.vim/tags/vxl
"set tags+=./tags;/

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_ShowScopeInAbbr = 1
"let OmniCpp_ShowPrototypeInAbbr = 2
"let OmniCpp_SelectFirstItem = 2


" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"inoremap <expr> <C-SPACE> omni#cpp#maycomplete#Complete()
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif "close preview window if leaving insert mode


let g:SuperTabDefaultCompletionType = "context"

let g:clang_library_path="/usr/lib/llvm"
let g:clang_auto_select=1
let g:clang_snippets=1
let g:clang_snippets_engine='snipmate'
source /usr/share/vim/vimfiles/autoload/snippets/snipmate.vim
let g:clang_use_library=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_auto_user_options='path, .clang_complete' ", gcc'

set makeprg=cd\ ~/AutoAuto/current/build;./make.vim\ &
set errorformat+=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
" Find definition of current symbol using Gtags
"load errorfile
noremap <C-E> <ESC>:cfile ~/.vim/errorfile<CR>

set path+=,,~/AutoAuto/current/,/usr/include,/usr/local/include,/usr/include/orocos

cscope add ~/AutoAuto/current/cscope.out ~/AutoAuto/current/

set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

let mapleader = ","
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"this info is more useful
noremap <C-G> 2<C-G>

" try for a while
inoremap jj <C-C>
inoremap :w<CR> <C-C>:w<CR>
inoremap  <C-C>:w<CR>
inoremap <F1> <C-C>

"latex 
let g:tex_flavor='latex'

noremap <A-Left> <C-O>
noremap <A-Right> <C-I>

