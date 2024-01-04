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
        { '<leader>ju', ':ToggleTerm 1<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>ji', ':ToggleTerm 2<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>jo', ':ToggleTerm 3<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<leader>jp', ':ToggleTerm 4<cr>', mode = 'n', desc = 'Launch Terminal' },
        { '<C-j>', '<C-\\><C-n>:ToggleTerm<cr>', mode = 't', desc = 'Close Terminal' },
        { '<Esc>', '<C-\\><C-n>', mode = 't', desc = 'Esc Terminal Mode' },
        { '<leader>tx', '<cmd>ToggleTermSendCurrentLine<cr>', desc = 'Execute Line' }
    }
}
