return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    opts = {
        direction = 'horizontal',
        start_in_insert = true,
        persist_mode = false,
        persist_size = false,
        size = vim.o.columns * 0.1
    },
    keys = {
        { '<C-j>', ':ToggleTerm<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>ju', ':ToggleTerm 1 direction=vertical<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>ji', ':ToggleTerm 2 direction=vertical<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>jo', ':ToggleTerm 3 direction=vertical<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>jp', ':ToggleTerm 4 direction=vertical<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<C-j>', '<C-\\><C-n>:ToggleTerm<cr>', mode = 't', desc = 'Close Terminal' },
        { '<Esc>', '<C-\\><C-n>', mode = 't', desc = 'Esc Terminal Mode' },
        { '<C-left>', '<C-\\><C-n><C-w><left>', mode = 't', desc = 'Window Focus Left' },
        { '<C-right>', '<C-\\><C-n><C-w><right>', mode = 't', desc = 'Window Focus Right' },
        { '<C-up>', '<C-\\><C-n><C-w><up>', mode = 't', desc = 'Window Focus Up' },
        { '<C-down>', '<C-\\><C-n><C-w><down>', mode = 't', desc = 'Window Focus Down' },
        { '<leader>tx', '<cmd>ToggleTermSendCurrentLine<cr>', desc = 'Execute Line' }
    }
}
