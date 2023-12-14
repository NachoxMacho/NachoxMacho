return {
    'hinell/duplicate.nvim',
    dependencies = { },
    keys = {
        { '<S-A-Up>',      '<cmd>LineDuplicate -1<cr>',   mode = 'n' },
        { '<S-A-Down>',    '<cmd>LineDuplicate +1<cr>',    mode = 'n' },

        -- Visual-mode commands
        { '<S-A-Up>',      ':VisualDuplicate -1<CR>',  mode = 'x' },
        { '<S-A-Down>',    ':VisualDuplicate 1<CR>',   mode = 'x' },
    }
}
