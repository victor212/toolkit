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
" set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 0
" let g:mucomplete#no_mappings = 1

" ============================================================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ============================================================
Plugin 'cscope.vim'

if has("cscope")
	set csprg=/usr/local/bin/cscope
	" csto = 0, cscope database will be search first, 1 ctags first
	set csto=0 	" cscope tag order

	" cst set this option so that search cscope and tags database at the
	" same time
	set cst
	" set nocst
	" cscopeverbose
	set nocsverb

	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	set csverb
	set cscopequickfix=s-,c-,d-,i-,t-,e-

endif

" leader key default is '\'
"
" \fa : 
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
" \l : show or close location quickfix window
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
" \fs
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>

" g: Find this definition
" \fg
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>

" d: Find functions called by this function
" \fd
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>

" c: Find functions calling this function
" \fc
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>

" t: Find this text string
" \ft
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>

" e: Find this egrep pattern
" \fe
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>

" f: Find this file, then open it
" \ff
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>

" i: Find files #including this file
" \fi
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>


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
set tags=tags 		" Ctags filename
"set tags+=xxxxx 	" Can add multi tags file
"set autochdir


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
"set expandtab 		" Expand to space
"set noexpandtab 	" No expand to space
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

