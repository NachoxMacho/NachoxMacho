return {
    'ThePrimeagen/git-worktree.nvim',
    config = function()
        require('git-worktree').setup()
        require('telescope').load_extension('git_worktree')
    end,
    keys = {
        { '<leader>gw', ':Telescope git_worktree<cr>',                                                 desc = 'Worktree' },
        { '<leader>gW', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', desc = 'Worktree Create' },
    }
}
