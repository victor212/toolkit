set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.
Plugin 'VundleVim/Vundle.vim'
set rtp+=~/.fzf			" Should run toolkit/install.sh first
Plugin 'junegunn/fzf.vim'
Plugin 'vim-easy-align'
Plugin 'editorconfig-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader key default is '\'
let g:mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List and search file
noremap <C-p> :Files<CR>

" Project File(List and search file in the whole project)
noremap <Space>pf :Files<CR>

" Find File in current file's folder
noremap <Space>ff :Files <C-R>=expand("%:p:h")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer(File) operation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search in buffer list(Opened file list)
noremap <Space>bb :Buffers<CR>

" Buffer Next(Show next opened file)
noremap <Space>bn :bn<CR>

" Buffer Previous(Show previous opened file)
noremap <Space>bp :bp<CR>
noremap <Space>bg :b<Space>

" Buffer Previous(Show last file)
noremap <Space><Tab> :b#<CR>

" Buffer Close(Close all opened files)
noremap <Space>bc :bufdo bd<CR>

" Search in Buffers(All opened files)
noremap <Space>sb :Lines<CR>

" File Outline(List Function name, etc.)
noremap <Space>fo :BTags<CR>
noremap <leader>fo :BTags<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search String in current file
noremap <Space>ss :BLines<CR>

" Search Project(Search in the whole project)
noremap <Space>sP :Rg! <C-R>=expand("<cword>")<CR><CR>
noremap <leader>rw :Rg! <C-R>=expand("<cword>")<CR><CR>

" Just show Rg command
noremap <Leader>r :Rg!<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code alignment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> :pyf ~/bin2/clang-format.py<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope setting and keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" ,fs Find C symbol under Cursor
nnoremap  <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>

" ,fg Find definition under Cursor
nnoremap  <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>

" ,fd Find functions called by function under Cursor
nnoremap  <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

" ,fc Find functions calling function under Cursor
nnoremap  <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>

" ,ft Find text string under Cursor
nnoremap  <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>

" ,fe Find egrep pattern
nnoremap  <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>

" ,ff Find file, then open it
nnoremap  <leader>ff :cs find f <C-R>=expand("<cword>")<CR><CR>

" ,fi Find files #including file under Cursor
nnoremap  <leader>fi :cs find i <C-R>=expand("<cword>")<CR><CR>

" ,g
noremap <leader>g :cstag<Space>

" ,fe
noremap <leader>e :cs find e<Space>

" Quickfix Keys
" :cw to show quickfix list
" :cn
" :cp

" Ctrl+l: Show quickfix window
noremap <C-L> :botright cw<CR>

" SPC + e + l hide quickfix window
noremap <Space>el :botright cw<CR>

" Ctrl+h: Hide quickfix window
noremap <C-H> :cclose<CR>

" SPC + e + h hide quickfix window
noremap <Space>eh :cclose<CR>

" SPC + e + < older quickfix window
noremap <Space>e< :colder<CR>

" SPC + e + > newer quickfix window
noremap <Space>e> :cnewer<CR>

" F8 Jump to previous quickfix item
noremap <F8> :cp<CR>

" SPC + e + p previous item
noremap <Space>ep :cp<CR>

" F9 Jump to next quickfix item
noremap <F9> :cn<CR>

" SPC + e + n next item
noremap <Space>en :cn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl+F
" Ctrl+B
" Ctrl+D
" Ctrl+U
" Ctro+E/Y scrolling with 5 lines every time
noremap <C-E> 20<C-E>
noremap <C-Y> 20<C-Y>

" zz  middle of window
" zt  top of window
" zb  bottom of window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag completion, list all symbol in ctags
inoremap<C-]> <C-X><C-]>

" Local keyword completion
inoremap<C-N> <C-X><C-N>

" Local MACRO definition completion
inoremap<C-D> <C-X><C-D>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags 		" Ctags filename
"set autochdir

set t_Co=256 	" If term only support 256 color, need to set it
set number		" Show line number
set nobackup		" no backup file
set noswapfile		" No swap file
set laststatus=2
set ruler
set tabstop=8		" Tab character width
"set softtabstop=8	" Set soft tab character width
"set shiftwidth=8	" Set auto indent width
"set expandtab 		" Expand to space
"set noexpandtab 	" No expand to space
set cc=80		" Should not exceed 80 characters
set ff=unix		" File Format
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

if has("autocmd")
autocmd BufNew,BufNewFile,BufRead *.md,*.markdown setlocal ft=markdown
endif
