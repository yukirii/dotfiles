" ~/.vimrc
" ------------------------------
set encoding=utf-8
set fileencoding=utf-8

set nocompatible

" dysplay
" ------------------------------
set number
set ruler
set wildmenu
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" ステータスラインを表示
set laststatus=2        " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容

" syntax color
" ------------------------------
syntax on
"colorscheme mrkn256
"colorscheme jellybeans
"colorscheme rdark
"colorscheme molokai
"colorscheme solarized

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
set incsearch     " インクリメンタル検索を有効化

" keymap
" ------------------------------
nnoremap <Space>  <C-E>
nnoremap <S-Space> <C-Y>
noremap ; :
noremap : ;
