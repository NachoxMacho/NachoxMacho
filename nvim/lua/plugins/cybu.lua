return {
    'ghillb/cybu.nvim',
    config = function ()
        require('cybu').setup({
        })
    end,
    keys = {
        { '<C-S-Left>', '<CMD>CybuNext<cr>', mode = 'n', desc = 'Next Buffer' },
        { '<C-S-Right>', '<CMD>CybuPrev<cr>', mode = 'n', desc = 'Prev Buffer' },
        { '<C-S-Left>', '<Esc><CMD>CybuNext<cr>', mode = 'i', desc = 'Next Buffer' },
        { '<C-S-Right>', '<Esc><CMD>CybuPrev<cr>', mode = 'i', desc = 'Prev Buffer' },
    }
}
