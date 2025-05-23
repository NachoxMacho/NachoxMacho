return {
    "andrewferrier/debugprint.nvim",

    opts = {},

    dependencies = {
        -- "echasnovski/mini.hipatterns",   -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)
        "nvim-telescope/telescope.nvim", -- Optional: If you want to use the `:Debugprint search` command with telescope.nvim
    },

    lazy = false, -- Required to make line highlighting work before debugprint is first used
    version = "*", -- Remove if you DON'T want to use the stable version
}
