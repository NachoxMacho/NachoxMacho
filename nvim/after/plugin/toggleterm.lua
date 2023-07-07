require('toggleterm').setup{
    direction = 'float',
    start_in_insert = true,
    persist_mode = false,
}

vim.keymap.set('n', '<leader>t', ':ToggleTerm<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:ToggleTerm<cr>')
