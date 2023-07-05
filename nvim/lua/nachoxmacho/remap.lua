
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>s", ":update<cr>", { desc = 'Save File' } )
vim.keymap.set('n', '<leader>q', ':q<cr>', { desc = 'Quit File (No Save)' } )
vim.keymap.set('n', '<leader>w', '<c-w>', { desc = 'Window Mode' } )

vim.keymap.set("n", "<A-up>", ":m -2<CR>", { desc = 'Move selection up' })
vim.keymap.set("n", "<A-down>", ":m +1<CR>", { desc = 'Move selection down' })

vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

vim.keymap.set('i', '<A-up>', '<Esc>:m -2 <enter>i', { desc = 'Move line up' })
vim.keymap.set('i', '<A-down>', '<Esc>:m +1 <enter>i', { desc = 'Move line down' })

vim.keymap.set('n', '<C-S-left>', '<Esc><C-w><left>', { desc = 'Window Focus Left' })
vim.keymap.set('n', '<C-S-right>', '<Esc><C-w><right>', { desc = 'Window Focus Right' })
vim.keymap.set('n', '<C-S-up>', '<Esc><C-w><up>', { desc = 'Window Focus Up' })
vim.keymap.set('n', '<C-S-down>', '<Esc><C-w><down>', { desc = 'Window Focus Down' })

vim.keymap.set('n', '<C-left>', ':bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-right>', ':bprevious<cr>', { desc = 'Prev buffer'})
vim.keymap.set('n', '<C-x>', ':bd<cr>', { desc = 'Close buffer' })

vim.keymap.set('i', '<C-left>', '<Esc>:bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('i', '<C-right>', '<Esc>:bnext<cr>', { desc = 'Next buffer' })