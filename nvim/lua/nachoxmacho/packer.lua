-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrap packer

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                          branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,}
        use("nvim-treesitter/playground")
        use("theprimeagen/harpoon")
        use("theprimeagen/refactoring.nvim")
        use("mbbill/undotree")
        use("tpope/vim-fugitive")
        use("nvim-treesitter/nvim-treesitter-context");

        use 'nvim-lualine/lualine.nvim'
        use {
            'folke/which-key.nvim',
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require('which-key').setup {}
            end
        }

        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            }
        }

        use 'lewis6991/gitsigns.nvim'
        use 'lukas-reineke/indent-blankline.nvim'

        use 'levouh/tint.nvim'
        use 'bekaboo/dropbar.nvim'
        use 'RRethy/vim-illuminate'
        use 'mhartington/formatter.nvim'
        use 'm4xshen/autoclose.nvim'
        use 'smolck/command-completion.nvim'
        use {
            'j-hui/fidget.nvim',
            tag = 'legacy'
        }
        use 'akinsho/toggleterm.nvim'
        use {
            'nvim-telescope/telescope-file-browser.nvim',
            requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
        }
        use 'terrortylor/nvim-comment'
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugin
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
