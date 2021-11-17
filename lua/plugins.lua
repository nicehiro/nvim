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
        use "wbthomason/lsp-status.nvim"
        -- lsp dap
        use 'mfussenegger/nvim-dap'
        use 'mfussenegger/nvim-dap-python'

        -- python black
        use {
            'averms/black-nvim',
            config = require 'plugin/black'
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

        -- since I only need simple tabline config which lualine can satisfy me
        -- use {
        --     'kdheepak/tabline.nvim',
        --     config = require 'plugin.tabline',
        --     requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
        -- }

        -- popup window
        use 'nvim-lua/popup.nvim'

        -- color theme
        use 'overcache/NeoSolarized'
        use 'NLKNguyen/papercolor-theme'

        -- which key
        use {
            "folke/which-key.nvim",
            config = function()
                require('which-key').setup {
                }
            end
        }

        -- auto pairs
        use {
            '/home/hiro/.config/nvim/local/nvim-autopairs',
            config = require 'plugin.autopairs'
        }

        -- comment
        use {
            "terrortylor/nvim-comment",
            config = require 'plugin.comment'
        }

        -- bufferline
        use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

        -- git
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

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
