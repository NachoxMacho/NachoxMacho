require('nvim_comment').setup({
    comment_empty = false,
})

vim.keymap.set({ 'n', 'v' }, '<leader>nc', ':CommentToggle<cr>')
vim.keymap.set('i', '<A-/>', '<Esc>:CommentToggle<cr>a')
