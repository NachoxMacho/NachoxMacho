return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-Right>"] = require('telescope.actions').cycle_previewers_next,
                        ["<C-Left>"] = require('telescope.actions').cycle_previewers_prev,
                    }
                }
            },
            pickers = {
                find_files = { find_command = { "rg", "--files", "--color", "never", "--hidden", "--glob", "!.git" } },
            }
        })
    end,
    keys = {
        { '<leader>ff', ':Telescope find_files hidden=true<cr>',                                                  desc = 'Files' },
        { '<leader>fa', '<cmd> Telescope find_files no_ignore=true hidden=true<cr>',                              desc = 'All Files' },
        { '<leader>fg', ':Telescope git_files<cr>',                                                               desc = 'Git Files' },
        { '<leader>fs', ':Telescope live_grep<cr>',                                                               desc = 'Search' },
        { '<leader>vh', ':Telescope help_tags<cr>',                                                               desc = 'Help' },
        { '<leader>r',  '<cmd>Telescope buffers sort_lastused=true ignore_current_buffer=true sort_mru=true<cr>', desc = 'Buffers' },
        { '<leader>fw', ':Telescope git_status<cr>',                                                              desc = 'Git Working Files (Status)' },
        { '<leader>ft', '<cmd>Telescope tags<cr>',                                                                desc = 'Tags' },
        { '<leader>ss', '<cmd>Telescope search_history<cr>',                                                      desc = 'Search History' },
    }
}
