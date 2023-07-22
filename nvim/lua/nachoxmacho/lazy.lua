-- Bootstrap Lazy.Nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

-- require('lazy').setup({
--     { 'chrisgrieser/nvim-genghis', dependencies = 'stevearc/dressing.nvim' },
--     { 'mhartington/formatter.nvim' },
-- })

-- return require('packer').startup(function(use)
--         use {
--             'VonHeikemen/lsp-zero.nvim',
--             branch = 'v1.x',
--             requires = {
--                 -- LSP Support
        --                 {'neovim/nvim-lspconfig'},
--                 {'williamboman/mason.nvim'},
--                 {'williamboman/mason-lspconfig.nvim'},

--                 -- Autocompletion
--                 {'hrsh7th/nvim-cmp'},
--                 {'hrsh7th/cmp-buffer'},
--                 {'hrsh7th/cmp-path'},
--                 {'saadparwaiz1/cmp_luasnip'},
--                 {'hrsh7th/cmp-nvim-lsp'},
--                 {'hrsh7th/cmp-nvim-lua'},

--                 -- Snippets
--                 {'L3MON4D3/LuaSnip'},
--                 {'rafamadriz/friendly-snippets'},
--             }
--         }

