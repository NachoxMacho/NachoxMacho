require('project_nvim').setup {
    ignore_lsp = { 'lua_ls' }
}

require('telescope').load_extension('projects')

vim.keymap.set('n', '<leader>fr', ':Telescope projects<cr>', { desc = 'Repo search' })
