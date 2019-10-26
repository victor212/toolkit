set nocompatible              " be iMproved, required
filetype off                  " required
let g:mapleader=","

" neovim report error
"if exists('$TMUX')
"	set term=screen-256color
"endif

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
" Should run toolkit/install.sh first
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
noremap <C-p> :Files<CR>
noremap <Space>pf :Files<CR>
noremap <Space>ff :Files <C-R>=expand("%:p:h")<CR><CR>
noremap <C-b> :Buffers<CR>
noremap <Space>bb :Buffers<CR>
" Close all buffers
noremap <Space>bc :bufdo bd<CR>
" Lines
" search all buffers
noremap <Space>sb :Lines<CR>

" BLines
" Search current buffer
noremap <Space>ss :BLines<CR>
" BTags
" Search file outline
noremap <leader>fo :BTags<CR>

" Search whole project
nnoremap  <Space>sP :Ag!  <C-R>=expand("<cword>")<CR><CR>

" ============================================================
Plugin 'Mark'

" ============================================================
" clang-format.py
map <C-K> :pyf ~/bin2/clang-format.py<CR>
" Can configure clang format path
"let g:clang_format_path = "clang-format-3.8"

" ============================================================
Plugin 'vim-airline'
Plugin 'vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ':t'
noremap <Space>bn :bn<CR>
noremap <Space>bp :bp<CR>
noremap <Space>bg :b<Space>
noremap <Space><Tab> :b#<CR>

" ============================================================
" Plugin 'vim-tmux-focus-events'
" Plugin 'vim-tmux-clipboard'

" let g:airline_theme="molokai"
set t_Co=256 	" If term only support 256 color, need to set it

" ============================================================
" Plugin 'cscope.vim'
" Some linux server cannot work, just skip it now

if has("cscope")
	if filereadable("/usr/local/bin/cscope")
		set csprg=/usr/local/bin/cscope
	endif
	if filereadable("/usr/bin/cscope")
		set csprg=/usr/bin/cscope
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
	set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

endif

" leader key default is '\'
"
" :cw to show quickfix list
" :cn
" :cp

noremap <C-L> :botright cw<CR>
noremap <C-H> :cclose<CR>
" SPC + e + l hide quickfix window
noremap <Space>el :cw<CR>
" SPC + e + h hide quickfix window
noremap <Space>eh :cclose<CR>
" SPC + e + < older quickfix window
noremap <Space>e< :colder<CR>
" SPC + e + > newer quickfix window
noremap <Space>e> :cnewer<CR>
noremap <F8> :cp<CR>
noremap <F9> :cn<CR>
" SPC + e + n next item
noremap <Space>en :cn<CR>
" SPC + e + p previous item
noremap <Space>ep :cp<CR>

" Scrolling
" Ctrl+F
" Ctrl+B
" Ctrl+D
" Ctrl+U
" Ctro+E/Y scrolling with 5 lines every time
noremap <C-E> 20<C-E>
noremap <C-Y> 20<C-Y>

" Completion
inoremap<C-]> <C-X><C-]>
inoremap<C-N> <C-X><C-N>
inoremap<C-D> <C-X><C-D>

" zz  middle of window
" zt  top of window
" zb  bottom of window

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

" \fg
noremap <leader>g :cstag<Space>

" \fe
noremap <leader>e :cs find e<Space>

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
" set cursorline
" set cursorcolumn

" no backup file
set nobackup

set noswapfile		" No swap file
set laststatus=2
set ruler
set tabstop=8		" Tab character width
"set softtabstop=8	" Set soft tab character width
"set shiftwidth=8	" Set auto indent width
"set expandtab 		" Expand to space
"set noexpandtab 	" No expand to space
set cc=81		" Should not exceed 80 characters
set ff=unix
set hlsearch		" Highlight search 
set incsearch		" Incremental search
set autoindent 		" Use  :set paste   set nopaste to enter paste mode
set cindent
set backspace=indent,eol,start	" Backspace key work mode
set history=1000	" Set command history
set showcmd		" Status bar show command
set showmatch		" 

syntax enable		" Syntax highlight keyword
syntax on
colorscheme desert 	" Can check in /usr/share/vim/xxx/colors
hi search term=standout ctermfg=0 ctermbg=3
hi ColorColumn term=standout ctermfg=9 ctermbg=8

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
filetype on		" Auto detect file type
filetype indent on	" Different file type use different indent
filetype plugin on
filetype plugin indent on

" zc close folder
" zo open folder
" za switch
set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
set foldlevelstart=99

