return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', mode = 'n', desc = 'Quick Fix'}
    }
}
