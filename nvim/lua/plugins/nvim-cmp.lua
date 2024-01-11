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

        local lspMapping = {
            ['<down>'] = cmp.mapping.select_next_item(),
            ['<up>'] = cmp.mapping.select_prev_item(),
            ['<enter>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
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
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }

        local cmdMapping = {
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-h>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
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
                    local lspkind_ok, lspkind = pcall(require, "lspkind")
                    if not lspkind_ok then
                        -- From kind_icons array
                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        vim_item.kind = kind_icons[vim_item.kind]
                        -- Source
                        return vim_item
                    else
                        -- From lspkind
                        return lspkind.cmp_format()
                    end
                end
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
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
            mapping = cmdMapping,
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
