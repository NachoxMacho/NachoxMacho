return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.api.nvim_command, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Pretty
        { 'onsails/lspkind.nvim' },

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    },
    config = function ()
        local lsp = require("lsp-zero")
        lsp.preset("recommended")
        lsp.ensure_installed({
            'azure_pipelines_ls',
            'clangd',
            'dockerls',
            'docker_compose_language_service',
            'helm_ls',
            'jsonls',
            'lua_ls',
            'powershell_es',
            'sqlls',
            'tsserver',
            'yamlls',
        })
        lsp.nvim_workspace()
        local cmp = require('cmp')
        local actions = require('lsp-zero').cmp_action()
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<enter>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            ['<C-k>'] = actions.toggle_completion(),
            ['<C-f>'] = cmp.mapping.close(),
        })

        local lspkind = require('lspkind')
        lspkind.init({
            mode = 'symbol_text',
            preset = 'default',
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('LuaSnip').lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format({
                })
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' }
            },
            mapping = cmp_mappings
        })

        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            },
        })

        lsp.on_attach(function(_, bufnr)
            vim.keymap.set("n", "<leader>nd", function() vim.lsp.buf.definition() end, { remap = false, buffer = bufnr, desc = 'Go to Definition' })
            vim.keymap.set("n", "<leader>nh", function() vim.lsp.buf.hover() end, { remap = false, buffer = bufnr, desc = 'Open Hover' })
            vim.keymap.set("n", "<leader>ns", function() vim.lsp.buf.workspace_symbol() end, { remap = false, buffer = bufnr, desc = 'Workspace Symbol' })
            vim.keymap.set("n", "<leader>nn", function() vim.lsp.buf.goto_next() end, { remap = false, buffer = bufnr, desc = 'Go to Next' })
            vim.keymap.set("n", "<leader>np", function() vim.lsp.buf.goto_prev() end, { remap = false, buffer = bufnr, desc = 'Go to Previous' })
            vim.keymap.set("n", "<leader>nr", function() vim.lsp.buf.rename() end, { remap = false, buffer = bufnr, desc = 'Rename' })
            vim.keymap.set('n', '<leader>nt', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000}) end, { remap = false, buffer = bufnr, desc = 'Format'})
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { remap = false, buffer = bufnr, desc = 'Signature Help' })
        end)

        lsp.setup()

        vim.diagnostic.config({ virtual_text = true })
        vim.keymap.set('n', '<leader>nq', function() vim.diagnostic.open_float(nil, {focus=false}) end, { desc = 'Open Diag'})
    end
}
