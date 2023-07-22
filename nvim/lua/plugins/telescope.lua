return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim'},
    tag = '0.1.2',
    lazy = false,
    config = function ()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Files'})
        vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files no_ignore=true hidden=true<cr>', { desc = 'All Files'})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Git Files'})
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Search'})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Help'})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers'})
        vim.keymap.set('n', '<leader>fw', ':Telescope git_status<cr>', { desc = 'Git Working Files (Status)'})

    end
}
