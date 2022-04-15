local map = vim.api.nvim_set_keymap
map('n',',', '',{})
vim.g.mapleader = ','

options = {noremap = true} 

-- Glow
map('n', '<leader>P', ':Glow<cr>', options)

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)

-- Doi2bib
map('n', '<leader>D', ':r !doi2bib', options)

-- Saving, writing, quitting 
map('n', '<leader>w', ':w<cr>', options) 
map('n', '<leader>s', ':w<cr>:source "/home/micke/.config/nvim/init.vim<cr>"', options)
map('n', '<leader>q', ':wq!<cr>', options)
map('i', '<space><tab>', '<esc>/<cr>vf>c', options)
