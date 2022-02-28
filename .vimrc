" Search for these to jump to a point in the config
" STATUSLINE
" MACROS
" PLUGINS

filetype plugin indent on

let mapleader=','

syntax enable
set number relativenumber
set tabstop=4
set expandtab
set shiftwidth=4

set fileencoding=utf-8
set encoding=utf-8

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%82v', 100)

command Preview :!firefox %<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

let g:vimtex_view_method = 'zathura'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" STATUSLINE
source ~/.vim/status.vim

" MACROS

inoremap <space><tab> <esc>/<++><cr>vf>c

nnoremap <leader>D :r !doi2bib 

nmap <Leader>q :q!<cr>
nmap <Leader>wq :wq!<cr>

" File movement
let g:netrw_winsize = 30
nnoremap <F3> :Lexplore<cr>

" vimrc
inoremap <leader>macro autocmd filetype  inoremap <++><esc>2bhi
nmap <Leader>s :w<CR>:source $MYVIMRC<CR>

" Markdown
autocmd filetype markdown inoremap h1 # 
autocmd filetype markdown inoremap h2 ## 
autocmd filetype markdown inoremap h3 ### 

" LaTeX 
autocmd filetype tex inoremap <leader>h1 \section{}<CR><++><esc>k$i
autocmd filetype tex inoremap <leader>h2 \subsection{}<cr><++><esc>k$i
autocmd filetype tex inoremap <leader>h3 \subsubsection{}<cr><++><esc>k$i
autocmd filetype tex inoremap <leader>em \emph{}<++><esc>F}i
autocmd filetype tex inoremap <leader>bf \textbf{}<++><esc>F}i
autocmd filetype tex inoremap <leader>ul \underline{}<++><esc>F}i
autocmd filetype tex inoremap <leader>bl \begin{itemize}<cr>\item <cr><esc>0i\end{itemize}<cr><esc>0i<++><esc>2k$a
autocmd filetype tex inoremap <leader>nl \begin{enumerate}<cr>\item <cr><esc>0i\end{enumerate}<cr><esc>0i<++><esc>2k$a
autocmd filetype tex inoremap <leader>be \begin{}<cr><++><cr><esc>0i\end{<++>}<esc>2k$i

" HTML
autocmd filetype html inoremap <leader>h1 <h1><++></h1><cr><++><esc>k0f>i
autocmd filetype html inoremap <leader>h2 <h2><++></h2><cr><++><esc>k0f>i
autocmd filetype html inoremap <leader>h3 <h3><++></h3><cr><++><esc>k0f>i

" Python
autocmd filetype python inoremap <leader>if if :<cr><++><esc>k$i
autocmd filetype python inoremap <leader>lf elif :<cr><++><esc>k$i
autocmd filetype python inoremap <leader>el else:<cr>
autocmd filetype python inoremap <leader>def def (<++>):<cr><++><esc>k0/(<cr>i
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear && python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!clear && !python3' shellescape(@%, 1)<CR>

