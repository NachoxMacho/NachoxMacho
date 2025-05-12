return {
    'ray-x/go.nvim',
    build = ':lua require("go.install").update_all_sync()',
    dependencies = {
        "ray-x/guihua.lua",
        'nvim-treesitter/nvim-treesitter',
        'theHamsta/nvim-dap-virtual-text',
        'mfussenegger/nvim-dap',
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "mfussenegger/nvim-dap",
                "nvim-neotest/nvim-nio"
            }
        },
    },
    opts = {
        lsp_cfg = false,
        tag_options = "",

        lsp_semantic_highlights = true,
        lsp_inlay_hints = {
            enabled = false,
            style = 'eol',
        },
        trouble = false,
        luasnip = true,
    },
    config = function(opts)
        require('go').setup(opts)

        vim.cmd(
            [[command! GoLintEx :setl makeprg=golangci-lint\ run\ | :GoMake]]
        )
    end
}
