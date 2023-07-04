
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>s", ":update<cr>", { desc = 'Save File' } )
vim.keymap.set('n', '<leader>q', ':q<cr>', { desc = 'Quit File (No Save)' } )
vim.keymap.set('n', '<leader>w', '<c-w>', { desc = 'Window Mode' } )

vim.keymap.set("n", "<A-up>", ":m -2<CR>")
vim.keymap.set("n", "<A-down>", ":m +1<CR>")

vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv")

vim.keymap.set('i', '<A-up>', '<Esc>:m -2 <enter>i')
vim.keymap.set('i', '<A-down>', '<Esc>:m +1 <enter>i')

vim.keymap.set('n', '<C-left>', ':bnext<cr>')
vim.keymap.set('n', '<C-right>', ':bprevious<cr>')
vim.keymap.set('n', '<C-x>', ':bd<cr>')

