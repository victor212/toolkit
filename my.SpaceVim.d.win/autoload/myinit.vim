function! myinit#before() abort
  execute "set cc=81"
  execute "set tags=tags"
  execute "set tabstop=8"
  execute "set nobackup"
  execute "set noswapfile"
  execute "set ff=unix"
  "execute "hi search term=standout ctermfg=0 ctermbg=3"
  "execute 'highlight' ColorColumn term=standout ctermfg=9 ctermbg=8

  execute "let g:python_host_prog  = 'C:\Python27_32bit\python'"
  "execute "let g:clang_format_path = '~\.SpaceVim.d\tools\clang-format.exe'"
  " Put clang-format.exe to gvim.exe folder is ok
  nnoremap <C-K> :pyf ~\.SpaceVim.d\tools\clang-format.py<CR>
  nnoremap <C-E> 20<C-E>
  nnoremap <C-Y> 20<C-Y>
  noremap <C-L> :botright cw<CR>
  noremap <C-H> :cclose<CR>
  noremap <F8> :cp<CR>
  noremap <F9> :cn<CR>

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

  " \g
  noremap <leader>g :cstag<Space>

  " \fe
  noremap <leader>e :cs find e<Space>

  execute "let g:spacevim_custom_color_palette = [
              \ ['#282828' , '#FFA500' , 250, 97],
              \ ['#d75fd7' , '#4e4e4e' , 170 , 239],
              \ ['#c6c6c6' , '#3a3a3a' , 251 , 237],
              \ ['#2c323c', 16],
              \ ['#282828', '#00BFFF', 114, 152],
              \ ['#2c323c', '#ff8787', 114, 210],
              \ ['#2c323c', '#d75f5f', 114, 167],
              \ ['#282828', '#689d6a', 235, 72],
              \ ['#282828', '#8f3f71', 235, 132],
              \ ]"
endfunction

function! myinit#after() abort
endfunction

