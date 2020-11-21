"Shahin Shahsavari's vimrc

" Map <leader> key to comma
let mapleader = " "

" line numbering
nmap <F3> :set number! <CR>
imap <F3> <esc> :set number! <CR>i

nmap <F4> :set relativenumber! <CR>
imap <F4> <esc> :set relativenumber! <CR>i


syntax on
" set ruler
" set autoindent
" set cindent
" set noexpandtab
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set foldmethod=syntax

" vim-slime config
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

" Send the entire file to bash
autocmd FileType python map <buffer> <leader><ENTER> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader><ENTER> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python setlocal expandtab

autocmd BufNewFile,BufRead *.c map <leader><ENTER> :w <CR> :!gcc % && ./a.out <CR>
autocmd BufNewFile,BufRead *.c imap <leader><ENTER> :w <CR> :!gcc % && ./a.out <CR>
