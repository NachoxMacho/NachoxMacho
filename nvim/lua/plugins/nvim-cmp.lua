return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 120,
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        -- Snippets
        luasnip.add_snippets("go", {
            luasnip.snippet("funchttp", {
                luasnip.text_node("func "),
                luasnip.insert_node(1),
                luasnip.text_node({ "(w http.ResponseWriter, r *http.Request) {", "\t" }),
                luasnip.insert_node(0),
                luasnip.text_node({ "", "}" })
            })
        })
        -- luasnip.add_snippets("go", {
        --     luasnip.snippet("en", {
        --         luasnip.text_node({ "if err != nil {", "\treturn err", "}" }),
        --     })
        -- })

        local lspMapping = {
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<enter>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true}),
            ['<C-k>'] = cmp.mapping({
                i = function(_)
                    if cmp.visible() then
                        cmp.close()
                    else
                        cmp.complete()
                    end
                end
            }),
            ['<C-f>'] = cmp.mapping.close(),
        }

        local cmdMapping = {
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
        }
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            formatting = {
                format = function(_, vim_item)
                    local kind_icons = {
                        Text = "",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰇽",
                        Variable = "󰂡",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰅲",
                    }
                    vim_item.kind = kind_icons[vim_item.kind]
                    -- Source
                    return vim_item
                end
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
                { name = "supermaven" },
            },
            view = {
                entries = 'custom',
                selection_order = 'near_cursor'
            },
            mapping = lspMapping
        })
        cmp.setup.cmdline('/', {
            sources = {
                { name = 'buffer' }
            }
        })
        cmp.setup.cmdline(':', {
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { '!' }
                    }
                }
            })
        })
    end
}
