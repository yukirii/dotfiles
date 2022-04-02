" ~/.config/nvim/init.vim
" ------------------------------
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932

" Plugins
" ------------------------------
if &compatible
  set nocompatible
endif

let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  let g:nvim_dir  = expand('~/.config/nvim')
  let s:toml      = g:nvim_dir . '/dein.toml'
  let s:lazy_toml = g:nvim_dir . '/dein_lazy.toml'

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
  if has('nvim')
    call dein#remote_plugins()
  endif
endif

filetype plugin indent on
syntax enable

" yonchu/accelerated-smooth-scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 6
let g:ac_smooth_scroll_fb_sleep_time_msec = 6


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

set conceallevel=0

" keymap
" ------------------------------
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
nnoremap <Space> <C-E>
nnoremap <S-Space> <C-Y>
noremap ; :
" wq alias
command! -nargs=0 Wq wq
