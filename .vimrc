set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" ============================================================
Plugin 'Tagbar'
map <F8> :TagbarToggle<CR>

" ============================================================
Plugin 'ctrlp.vim'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }  


" ============================================================
Plugin 'The-NERD-tree'
" Set toggle key map
map <C-n> :silent! NERDTreeToggle<CR>
let NERDTreeWinSize=40

" ============================================================
Plugin 'Mark'


" ============================================================
Plugin 'TagHighlight'

" ============================================================
Plugin 'taglist.vim'
map <F10> :silent! TlistToggle<CR>
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1
let Tlist_WinWidth=40
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

" ============================================================
Plugin 'vim-mucomplete'
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 0

" ============================================================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ============================================================
set autochdir

set number
set cursorline
" set cursorcolumn

" no backup file
set nobackup

set noswapfile		" No swap file
set laststatus=2
set ruler
set tabstop=8		" Tab character width
"set softtabstop=8	" Set soft tab character width
"set shiftwidth=8	" Set audo indent width
set cc=81		" Should not exceed 80 characters
set ff=unix
set hlsearch		" Highlight search 
set incsearch		" Incremental search
set autoindent
set cindent
set backspace=indent,eol,start	" Backspace key work mode
set history=1000	" Set command history
set showcmd		" Status bar show command
set showmatch		" 

syntax enable		" Syntax highlight keyword
syntax on
colorscheme desert

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
filetype on		" Auto detect file type
filetype indent on	" Different file type use different indent
filetype plugin on
filetype plugin indent on

