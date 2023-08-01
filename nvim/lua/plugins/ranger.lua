return {
    "kelly-lin/ranger.nvim",
    config = function()
        require("ranger-nvim").setup({ replace_netrw = true })
        vim.api.nvim_set_keymap("n", "<leader>fv", "", {
            noremap = true,
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })
    end,
    cond = function()
        return vim.fn.executable('ranger') == 1
    end,
}
