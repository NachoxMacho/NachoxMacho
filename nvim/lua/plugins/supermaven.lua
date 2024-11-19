return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            ignore_filetypes = { "go" },
            disable_inline_completion = true,
            disable_keymaps = true,
        })
    end,
}
