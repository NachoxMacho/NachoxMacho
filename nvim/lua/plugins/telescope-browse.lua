return {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
      require('telescope').setup { extensions = { file_browser = { } } }
      require('telescope').load_extension 'file_browser'
    end,
    keys = {
        { '<leader>fv', ':Telescope file_browser<cr>', desc = 'File Browser' }
    }
}

-- local fb_actions = require 'telescope._extensions.file_browser.actions'

-- require('telescope').setup {
--     extensions = {
--         file_browser = {

--         }
--     }
-- }

-- require('telescope').load_extension 'file_browser'

-- vim.keymap.set('n', '<leader>fv', ':Telescope file_browser<cr>', { desc = 'File Browser' })
