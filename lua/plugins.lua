vim.cmd 'packadd packer.nvim'

packer = require 'packer'
packer.startup(
    function()
        use 'wbthomason/packer.nvim'

        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        -- lsp
        use 'neovim/nvim-lspconfig'

        -- cmp
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

        -- vsnip
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'

        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{ 'nvim-lua/plenary.nvim' }}
        }
    end
)

require 'plugin.ts'
require 'plugin.cmp'
require 'plugin.lsp'
