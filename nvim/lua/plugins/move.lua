return {
    'hinell/move.nvim',
    keys = {
        { '<A-Up>',      ':MoveLine -1<CR>',   mode = 'n' },
        { '<A-Down>',    ':MoveLine 1<CR>',    mode = 'n' },
        { '<A-S-Left>',  ':MoveWord -1<CR>',   mode = 'n' },
        { '<A-S-Right>', ':MoveWord 1<CR>',    mode = 'n' },

        -- Visual-mode commands
        { '<A-Up>',      ':MoveBlock -1<CR>',  mode = 'x' },
        { '<A-Down>',    ':MoveBlock 1<CR>',   mode = 'x' },
        { '<A-Left>',    ':MoveHBlock -1<CR>', mode = 'v' },
        { '<A-Right>',   ':MoveHBlock 1<CR>',  mode = 'v' },
    }
}
