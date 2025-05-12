return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "jmacadie/telescope-hierarchy.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function ()
                return vim.fn.executable 'make' == 1
            end,
        }
    },
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
            },
            extensions = {
                hierarchy = {
                    -- telescope-hierarchy.nvim config
                    -- these are the defaults and no need to reset them if you like these
                    initial_multi_expand = false, -- Run a multi-expand on open? If false, will only expand one layer deep by default
                    multi_depth = 5,              -- How many layers deep should a multi-expand go?
                    layout_strategy = "horizontal",
                },
                fzf = {},
            },
        })

        require('telescope').load_extension('hierarchy')
        require('telescope').load_extension('fzf')
    end,
    cmd = {
        'Telescope',
    },
    keys = {
        { '<leader>ff', ':Telescope find_files hidden=true<cr>',                                                  desc = 'Files' },
        { '<leader>fa', '<cmd> Telescope find_files no_ignore=true hidden=true<cr>',                              desc = 'All Files' },
        { '<leader>fg', ':Telescope git_files<cr>',                                                               desc = 'Git Files' },
        { '<leader>fs', ':Telescope live_grep<cr>',                                                               desc = 'Search' },
        { '<leader>vh', ':Telescope help_tags<cr>',                                                               desc = 'Help' },
        { '<leader>r',  '<cmd>Telescope buffers sort_lastused=true ignore_current_buffer=true sort_mru=true<cr>', desc = 'Buffers' },
        { '<leader>fw', ':Telescope git_status<cr>',                                                              desc = 'Git Working Files (Status)' },
        { '<leader>ft', '<cmd>Telescope tags<cr>',                                                                desc = 'Tags' },
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>',                                                         desc = 'Diagnostics' },
    }
}
