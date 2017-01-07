" ~/.vimrc
" ------------------------------
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set nocompatible
filetype plugin indent on
syntax enable


" Plugins
" ------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/bundle/dein.vim

if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  call dein#end()
  call dein#save_state()
endif


" dysplay
" ------------------------------
set number
set ruler
set wildmenu
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set statusline=%F%r%h%=


" edit
" ------------------------------
filetype plugin on
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
au FileType go setlocal sw=4 ts=4 sts=4 noet
set incsearch
set backspace=indent,eol,start


" keymap
" ------------------------------
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Space> <C-E>
nnoremap <S-Space> <C-Y>
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap ; :
" wq alias
command! -nargs=0 Wq wq
