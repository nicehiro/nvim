local map = vim.api.nvim_set_keymap


-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '


options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)


local cmd = vim.cmd

cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa wqa')
cmd(':command! W w')
cmd(':command! Q q')

-- some emacs keybinds
map('n', '<C-x><C-s>', ':w<CR>', options)
map('i', '<C-x><C-s>', ':w<CR>', options)

-- source current file
map('n', '<leader>vs', ':source %<CR>', options)
-- source a visual range
map('v', '<leader>vs', 'y:@<CR>', options)
