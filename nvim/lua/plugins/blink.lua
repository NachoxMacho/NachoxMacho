return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        'rafamadriz/friendly-snippets',
        {
            "supermaven-inc/supermaven-nvim",
            dependencies = {
                {
                    'saghen/blink.compat',
                    version = '*',
                    opts = {
                        impersonate_nvim_cmp = true,
                    }
                },
            },
            opts = {
                disable_inline_completion = true, -- disables inline completion for use with cmp
                disable_keymaps = true,       -- disables built in keymaps for more manual control
            },
        },
    },

    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            preset = 'none',
            ['<C-space>'] = { 'show_documentation', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<Enter>'] = { 'accept', 'fallback' },
            ['<C-k>'] = { 'show', 'hide', 'fallback' },
            ['<C-l>'] = { 'snippet_forward' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            -- use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },
        cmdline = {
            keymap = { preset = 'inherit' },
            completion = {
                menu = { auto_show = true },
                list = {
                    selection = {
                        preselect = false,
                    },
                },
            },
        },
        completion = {
            keyword = {
                range = "full",
            },
            accept = {
                auto_brackets = {
                    kind_resolution = {
                        blocked_filetypes = { 'ps1' }
                    }
                },
            },
            menu = {
                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
        },

        snippets = { preset = 'luasnip' },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'supermaven' },
            providers = {
                -- create provider
                supermaven = {
                    name = 'supermaven',
                    module = 'blink.compat.source',
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Supermaven"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            }
        },
    },
    opts_extend = { "sources.default" }
}
