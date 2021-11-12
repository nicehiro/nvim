local tl = require 'telescope'
local map = vim.api.nvim_set_keymap


tl.setup{
    defaults = {
        mappings = {
        }
    },
    pickers = {
    },
    extensions = {
    }
}

options = { noremap = true }
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', options)

-- some emacs key bindings
map('n', '<C-x>b', '<cmd>Telescope buffers<CR>', options)
map('n', '<C-x><C-f>', '<cmd>Telescope find_files<CR>', options)
