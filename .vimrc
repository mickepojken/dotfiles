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
call matchadd('ColorColumn', '\%81v', 100)

command Preview :!firefox %<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
call plug#end()

let g:vimtex_view_method = 'zathura'

" STATUSLINE
set laststatus=2
set statusline=
set statusline+=%1*\ 
set statusline+=%2*
set statusline+=\ %{StatuslineMode()}\ 
set statusline+=%1*
set statusline+=\ 
set statusline+=📁
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=%=
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%3*
set statusline+=%{b:gitbranch}
set statusline+=%1*
set statusline+=\ 
set statusline+=%4*
set statusline+=%F::
set statusline+=%5*
set statusline+=(%l
set statusline+=/
set statusline+=%L)
set statusline+=%1*
set statusline+=\ 
set statusline+=w:%{WordCount()}\ 
set statusline+=%y
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=black ctermfg=white guibg=black guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction


function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    elseif l:mode==?"s"
        return "SELECT"
    elseif l:mode==#"t"
        return "TERMINAL"
    elseif l:mode==#"c"
        return "COMMAND"
    elseif l:mode==#"!"
        return "SHELL"
    endif
endfunction

function! StatuslineGitBranch()
    let b:gitbranch=""
    if &modifiable
        try
            let l:dir=expand('%:p:h')
            let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
            if !v:shell_error
                let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
            endif
        catch
        endtry
    endif
endfunction

augroup GetGitBranch
    autocmd!
    autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

" MACROS

inoremap <space><tab> <esc>/<++><cr>vf>c

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

