return {
    'letieu/jot.lua',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        notes_dir = vim.fn.stdpath("data") .. "/jot",
    },
    keys = {
        { '<leader>sp', function() require('jot').toggle() end, mode = 'n', desc = 'Scratch Pad' }
    }
}
