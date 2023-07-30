return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim'},
    tag = '0.1.2',
    config = function ()
        require('telescope').setup({})
    end,
    keys = {
        { '<leader>ff', ':Telescope find_files<cr>', desc = 'Files' },
        { '<leader>fa', '<cmd> Telescope find_files no_ignore=true hidden=true<cr>', desc = 'All Files' },
        { '<leader>fg', ':Telescope git_files<cr>', desc = 'Git Files' },
        { '<leader>fs', ':Telescope live_grep<cr>', desc = 'Search' },
        { '<leader>vh', ':Telescope help_tags<cr>', desc = 'Help' },
        { '<leader>fb', ':Telescope buffers<cr>', desc = 'Buffers' },
        { '<leader>fw', ':Telescope git_status<cr>', desc = 'Git Working Files (Status)' },
    }
}
