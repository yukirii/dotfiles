" ~/.config/nvim/init.vim
" ------------------------------
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set nocompatible
filetype plugin indent on
syntax enable


" Plugins
" ------------------------------
set runtimepath+=~/.config/nvim/bundle/dein.vim
let s:dein_dir = expand('~/.config/nvim/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:nvim_dir  = expand('~/.config/nvim')
  let s:toml      = g:nvim_dir . '/dein.toml'
  let s:lazy_toml = g:nvim_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" yonchu/accelerated-smooth-scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 8
let g:ac_smooth_scroll_fb_sleep_time_msec = 8


" theme
" ------------------------------
set t_Co=256
set background=dark
if (has('termguicolors'))
  set termguicolors
endif
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid


" display
" ------------------------------
set number
set ruler
set wildmenu
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set statusline=%F%r%h%=
au VimLeave * set guicursor=a:hor10-blinkon0


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
set nofoldenable


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
