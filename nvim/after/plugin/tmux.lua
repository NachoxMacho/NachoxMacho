require('nvim-tmux-navigation').setup({})

vim.keymap.set({'n', 'i' }, '<C-left>', '<Esc><C-w><left>', { desc = 'Window Focus Left' })
vim.keymap.set({'n', 'i' }, '<C-right>', '<Esc><C-w><right>', { desc = 'Window Focus Right' })
vim.keymap.set({'n', 'i' }, '<C-up>', '<Esc><C-w><up>', { desc = 'Window Focus Up' })
vim.keymap.set({'n', 'i' }, '<C-down>', '<Esc><C-w><down>', { desc = 'Window Focus Down' })

