return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    opts = {
        direction = 'float',
        start_in_insert = true,
        persist_mode = false,
    },
    keys = {
        { '<C-j>', ':ToggleTerm<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<C-j>', '<C-\\><C-n>:ToggleTerm<cr>', mode = 't', desc = 'Close Terminal' },
        { '<Esc>', '<C-\\><C-n>', mode = 't', desc = 'Esc Terminal Mode' }
    }
}

-- require('toggleterm').setup{
--     direction = 'float',
--     start_in_insert = true,
--     persist_mode = false,
-- }

-- vim.keymap.set('n', '<C-j>', ':ToggleTerm<cr>')
-- vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:ToggleTerm<cr>')
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
