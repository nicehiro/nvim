local map = vim.api.nvim_set_keymap


options = {noremap = true, silent = true}
map('n', '<C-q>', '<cmd>call Black()<CR>', options)
map('i', '<C-q>', '<cmd>call Black()<CR>', options)
