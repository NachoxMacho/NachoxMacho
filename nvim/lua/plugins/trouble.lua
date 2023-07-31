return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        use_diagnostic_signs = true,
        action_keys = {
            close = { 'q', '<esc>' },
        }
    },
    keys = {
        { '<leader>nxx', '<cmd>TroubleToggle quickfix<cr>', mode = 'n', desc = 'Quick Fix' },
        { '<leader>nxd', '<cmd>TroubleToggle document_diagnostics<cr>', mode = 'n', desc = 'Document problems' },
        { '<leader>nxw', '<cmd>TroubleToggle workspace_diagnostics<cr>', mode = 'n', desc = 'Workspace problems' }
    }
}
