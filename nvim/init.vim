filetype plugin indent on
syntax on                   " syntax highlighting

lua << EOF
require('settings')
require('keymaps')

EOF

" PLUGINS
call plug#begin()
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
call plug#end()


" Glow config
let g:glow_binary_path = "/home/micke/.local/bin"
let g:glow_border = "rounded"
let g:glow_style = "light"

" Dashboard
let g:dashboard_default_executive ='telescope'

" STATUSLINE
source ~/.config/nvim/status.vim

autocmd FileType lua inoremap nmap map('n', '<++>', '<++>', options)<esc>0/<cr>vf>c
