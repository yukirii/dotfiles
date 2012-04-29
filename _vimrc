" ~/.vimrc
" ------------------------------
set encoding=utf-8
set fileencodings=euc-jp,sjis,utf-8

set nocompatible	

" dysplay
" ------------------------------
set number	
set ruler
set wildmenu

" ステータスラインを表示
set laststatus=2		" ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容

" syntax color
" ------------------------------
syntax on
colorscheme mrkn256

" edit
" ------------------------------
filetype on
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
set autoindent
set shiftwidth=4
set tabstop=4

set incsearch			" インクリメンタル検索を有効化


" keymap
" ------------------------------
nnoremap <Space>  <C-E>
nnoremap <S-Space> <C-Y>

" command
noremap ; :
noremap : ;

"{$B$,F~NO$5$l$?$H$-$K2~9T(B+$BJD$83g8L$rJd40$9$k(B
"function GetBraceForC()
"  let line = strpart(getline('.'), 0, col('.') - 1)
"    if line =~ ') \=$'
"	    return "{\n}\<Esc>0bo"
"	else
"	    return "{}\<Left>"
"   endif
"endfunction
"au FileType c,cpp,java,javascript inoremap <expr> { GetBraceForC()
