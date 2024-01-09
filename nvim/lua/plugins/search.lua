return {
    "backdround/improved-search.nvim",
    event = 'VeryLazy',
    config = function()
        local search = require('improved-search')

        vim.keymap.set({ "n", "x", "o" }, "n", search.stable_next)
        vim.keymap.set({ "n", "x", "o" }, "N", search.stable_previous)

        -- Search current word without moving.
        vim.keymap.set("n", "<leader>!", search.current_word)

        -- Search selected text in visual mode
        vim.keymap.set("x", "<leader>!", search.in_place) -- search selection without moving
        vim.keymap.set("x", "<leader>*", search.forward) -- search selection forward
        vim.keymap.set("x", "<leader>#", search.backward) -- search selection backward
    end
}
