configs = require 'nvim-treesitter.configs'

configs.setup {
    ensure_installed = {'lua', 'python'},
    highlight = {
        enable = true,
    },
}
