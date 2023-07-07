require('toggleterm').setup{
    direction = 'float'
}

vim.keymap.set('n', '<leader>t', ':ToggleTerm<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:ToggleTerm<cr>')
