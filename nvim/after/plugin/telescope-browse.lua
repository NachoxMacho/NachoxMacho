local fb_actions = require 'telescope._extensions.file_browser.actions'

require('telescope').setup {
    extensions = {
        file_browser = {
            
        }
    }
}

require('telescope').load_extension 'file_browser'

vim.keymap.set('n', '<leader>fv', ':Telescope file_browser<cr>', { desc = 'File Browser' })
