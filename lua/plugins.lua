vim.cmd 'packadd packer.nvim'

packer = require 'packer'
packer.startup({
    function()
        use 'wbthomason/packer.nvim'

        -- treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = require 'plugin/ts'
        }

        -- lsp
        use 'neovim/nvim-lspconfig'
        use {
            'glepnir/lspsaga.nvim',
            config = require 'plugin/lsp'
        }

        -- cmp
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use {
            'hrsh7th/nvim-cmp',
            config = require 'plugin/cmp'
        }

        -- vsnip
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'

        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{ 'nvim-lua/plenary.nvim' }},
            config = require 'plugin/tl'
        }

        -- statusline
        use {
            'nvim-lualine/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
            config = require 'plugin.lualine'
        }

        -- popup window
        use 'nvim-lua/popup.nvim'

        -- color theme
        use 'overcache/NeoSolarized'

        -- which key
        use {
            "folke/which-key.nvim",
            config = function()
                require('which-key').setup {
                }
            end
        }

        -- auto pairs
        use 'windwp.nvim-autopairs'
    end,

    config = {
        profile = {
            enable = true,
            threshold = 1
        },
        display = {
            open_fn = function()
                return require('packer.util').float({border = 'single'})
            end
        }
    }
})
