return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function ()
        local gs = require('gitsigns')
        gs.setup()
        vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Chunk'})
        vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Chunk'})
        vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage Chunk'})
        vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset Chunk'})
        vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Unstage Chunk' })
        vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Chunk' })
        vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'Blame' })
        vim.keymap.set('n', '<leader>hB', gs.toggle_current_line_blame, { desc = 'Toggle inline blame' })
        vim.keymap.set('n', '<leader>hd', gs.toggle_deleted, { desc = 'Toggle deleted'})
    end,
}
