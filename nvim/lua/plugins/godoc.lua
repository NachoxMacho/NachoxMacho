return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
        { "nvim-telescope/telescope.nvim" }, -- optional
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
                ensure_installed = { "go" },
            },
        },
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDocs" },                                                -- optional
    ---@type godoc.types.GodocConfig
    opts = {
        adapters = {
            -- for details, see lua/godoc/adapters/go.lua
            {
                name = "go",
                opts = {
                    command = "GoDocs", -- the vim command to invoke Go documentation
                    get_syntax_info = function()
                        return {
                            filetype = "godoc", -- filetype for the buffer
                            language = "go", -- tree-sitter parser, for syntax highlighting
                        }
                    end,
                },
            },
        },
        window = {
            type = "split", -- split | vsplit
        },
        picker = {
            type = "telescope", -- native (vim.ui.select) | telescope | snacks | mini
        },
    },
}
