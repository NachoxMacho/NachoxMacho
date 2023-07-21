require('toggleterm').setup{
    direction = 'float',
    start_in_insert = true,
    persist_mode = false,
}

vim.keymap.set('n', '<C-j>', ':ToggleTerm<cr>')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:ToggleTerm<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:ToggleTerm<cr>')
