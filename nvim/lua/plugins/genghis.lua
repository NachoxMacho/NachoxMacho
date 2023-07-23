return {
    'chrisgrieser/nvim-genghis',
    dependencies = {
        'stevearc/dressing.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-omni'
    },
    keys = {
        { '<leader>fm', ':Move<cr>', desc = 'Move File' },
        { '<leader>fd', ':Duplicate<cr>', desc = 'Duplicate File' },
        { '<leader>fx', ':Chmodx<cr>', desc = 'Chmod x File' },
        { '<leader>fr', ':Trash<cr>', desc = 'Delete File' },
    },
    config = function ()
        -- required setup for cmp, somewhere after your main cmp-config
        local cmp = require('cmp')
        cmp.setup.filetype('DressingInput', {
            sources = cmp.config.sources { {name = 'omni'} },
        })
    end
}
