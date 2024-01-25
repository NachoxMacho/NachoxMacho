return {
    'hrsh7th/nvim-pasta',
    event = 'VeryLazy',
    commit = 'cccfcdee507eed014557577380fc95cb32abe88a',
    config = function ()
        require('pasta').setup({
        })
        vim.keymap.set({'n', 'x'}, 'p', require('pasta.mappings').p)
        vim.keymap.set({'n', 'x'}, 'P', require('pasta.mappings').P)
    end
}

