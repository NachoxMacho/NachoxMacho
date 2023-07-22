return {
    'nvimdev/lspsaga.nvim',
    config = function ()
        require('lspsaga').setup({

        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },
    event = 'LspAttach',
    keys = {
        { '<leader>npd', ':Lspsaga peek_definition<cr>', desc = 'Peek Definition' },
        { '<leader>no', ':Lspsaga outline<cr>', desc = 'Outline' },
        { '<leader>nf', ':Lspsaga finder def+ref<cr>', desc = 'Finder' },
        { '<leader>na', ':Lspsaga code_action<cr>', desc = 'Actions' },
    }
}
