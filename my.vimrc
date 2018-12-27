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
" Can refer to help doc, if cannot show arrows correctly,
" this can be enabled
let g:tagbar_iconchars = ['+', '-']

" ============================================================
Plugin 'ack.vim'
" \a to search
nnoremap <Leader>a :Ack!<Space>
let g:ackhighlight = 1

" ============================================================
"Plugin 'ctrlp.vim'
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"    \ 'file': '\v\.(exe|so|o)$',
"    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"    \ }  
"
"let g:ctrlp_working_path_mode="" 	" Always search from top

" ============================================================
" Use tag v1.01 because it support vim v7.3
Plugin 'LeaderF'
" ctrl+p to lauch Leaderf
noremap <C-p> :Leaderf<CR>
let g:Lf_DefaultMode=1 	" Search full path

" ============================================================
Plugin 'The-NERD-tree'
" Set toggle key map
map <C-n> :silent! NERDTreeToggle<CR>
let NERDTreeWinSize=40
" Enable this if Arrows cannot be show correctly
let NERDTreeDirArrows=0

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
Plugin 'vim-airline'
Plugin 'vim-airline-themes'

" let g:airline_theme="molokai"
set t_Co=256 	" If term only support 256 color, need to set it

" ============================================================
" Plugin 'cscope.vim'
" Some linux server cannot work, just skip it now

if has("cscope")
	if filereadable("/usr/local/bin/cscope")
		set csprg=/usr/local/bin/cscope
	endif
	if filereadable("/usr//bin/cscope")
		set csprg=/usr//bin/cscope
	endif

	" csto = 0, cscope database will be search first, 1 ctags first
	set csto=0 	" cscope tag order

	" cst set this option so that search cscope and tags database at the
	" same time
	set cst
	" set nocst
	" cscopeverbose
	set nocsverb

	" add any database in current directory
	if filereadable(".cscope/cscope.out")
		cs add .cscope/cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	set csverb
	set cscopequickfix=s-,c-,d-,i-,t-,e-

endif

" leader key default is '\'
"
" :cw to show quickfix list
" :cn
" :cp

" s: Find this C symbol
" \fs
nnoremap  <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>

" g: Find this definition
" \fg
nnoremap  <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>

" d: Find functions called by this function
" \fd
nnoremap  <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

" c: Find functions calling this function
" \fc
nnoremap  <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>

" t: Find this text string
" \ft
nnoremap  <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>

" e: Find this egrep pattern
" \fe
nnoremap  <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>

" f: Find this file, then open it
" \ff
nnoremap  <leader>ff :cs find f <C-R>=expand("<cword>")<CR><CR>

" i: Find files #including this file
" \fi
nnoremap  <leader>fi :cs find i <C-R>=expand("<cword>")<CR><CR>


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
set tags=.cscope/tags 		" Ctags filename
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
"set cc=81		" Should not exceed 80 characters
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
colorscheme desert 	" Can check in /usr/share/vim/xxx/colors

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
filetype on		" Auto detect file type
filetype indent on	" Different file type use different indent
filetype plugin on
filetype plugin indent on

