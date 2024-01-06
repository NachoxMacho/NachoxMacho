return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        use_diagnostic_signs = true,
        action_keys = {
            close = { 'q', '<esc>' },
            open_split = {},
        }
    },
    keys = {
        -- { '<leader>nxx', '<cmd>TroubleToggle quickfix<cr>', mode = 'n', desc = 'Quick Fix' },
        { '<leader>nxd', '<cmd>TroubleToggle document_diagnostics<cr>', mode = 'n', desc = 'Document problems' },
        { '<leader>nx', '<cmd>TroubleToggle workspace_diagnostics<cr>', mode = 'n', desc = 'Workspace problems' },
        { '<leader>nn', function () require("trouble").next({ skip_groups = true, jump = true}) end, mode = 'n', desc = 'Jump Next' },
        { '<leader>np', function () require("trouble").previous({ skip_groups = true, jump = true}) end, mode = 'n', desc = 'Jump Previous' },
    }
}
