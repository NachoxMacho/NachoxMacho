require('telescope').load_extension('repo')

vim.keymap.set('n', '<leader>fr', ':Telescope repo list<cr>')
