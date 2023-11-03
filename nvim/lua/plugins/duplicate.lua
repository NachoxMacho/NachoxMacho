return {
    'hinell/duplicate.nvim',
    dependencies = { },
    keys = {
        { '<S-A-Up>',      ':LineDuplicate -1<CR>',   mode = 'n' },
        { '<S-A-Down>',    ':LineDuplicate 1<CR>',    mode = 'n' },

        -- Visual-mode commands
        { '<S-A-Up>',      ':VisualDuplicate -1<CR>',  mode = 'x' },
        { '<S-A-Down>',    ':VisualDuplicate 1<CR>',   mode = 'x' },
    }
}
