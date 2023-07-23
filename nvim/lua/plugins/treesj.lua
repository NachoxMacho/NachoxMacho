return {
    'Wansmer/treesj',
    keys = {
        { '<leader>nj', '<CMD>TSJToggle<cr>', desc = 'Toggle TS Join' }
    },
    cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin', },
    opts = { use_default_keymaps = false }
}
