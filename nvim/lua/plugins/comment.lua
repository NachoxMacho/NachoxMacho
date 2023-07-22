return {
    'terrortylor/nvim-comment',
    config = function ()
        require('nvim_comment').setup({ comment_empty = true })
    end,
    keys = {
        { '<leader>nc', ':CommentToggle<cr>', mode = { 'n', 'v' }, desc = 'Toggle Comment' },
        { '<A-/>', '<Esc>:CommentToggle<cr>a', mode = 'i', desc = 'Toggle Comment' }
    }
}
