filetype plugin indent on
syntax on                   " syntax highlighting

lua << EOF
require('settings')
require('keymaps')
EOF

" PLUGINS
call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
call plug#end()

let g:vimtex_view_method = 'zathura'

" Glow config
let g:glow_binary_path = "/home/micke/.local/bin"
let g:glow_border = "rounded"
let g:glow_style = "dark"

" Dashboard
let g:dashboard_default_executive ='telescope'

" STATUSLINE
source ~/.config/nvim/status.vim

"autocmd FileType lua inoremap nmap map('n', '<++>', '<++>', options)<esc>0/<cr>vf>c

inoremap <space><tab> <esc>/<++><cr>vf>c

let mapleader = ","

" LaTeX commands
autocmd filetype tex inoremap <leader>se \section{}<CR><++><esc>k$i
autocmd filetype tex inoremap <leader>sse \subsection{}<cr><++><esc>k$i
autocmd filetype tex inoremap <leader>ssse \subsubsection{}<cr><++><esc>k$i
autocmd filetype tex inoremap <leader>em \emph{}<++><esc>F}i
autocmd filetype tex inoremap <leader>bf \textbf{}<++><esc>F}i
autocmd filetype tex inoremap <leader>it \textit{}<++><esc>F}i
autocmd filetype tex inoremap <leader>ul \underline{}<++><esc>F}i
autocmd filetype tex inoremap <leader>bl \begin{itemize}<cr>\item <cr><esc>0i\end{itemize}<cr><esc>0i<++><esc>2k$a
autocmd filetype tex inoremap <leader>nl \begin{enumerate}<cr>\item <cr><esc>0i\end{enumerate}<cr><esc>0i<++><esc>2k$a
autocmd filetype tex inoremap <leader>be \begin{}<cr><++><cr><esc>0i\end{<++>}<esc>2k$i
autocmd filetype tex inoremap <leader>use \usepackage[]{<++>}<esc>0/]<cr>i
autocmd filetype tex inoremap <leader>fi \begin{figure}<cr>\includegraphics[width=]{<++>}<cr>\caption{<++>}<cr>\label{fig:<++>}<cr>\end{figure}<esc>3k$ba

" Insert timestamp
nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M %p")<CR>
imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>

