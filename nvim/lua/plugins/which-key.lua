return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 250
    end,
    opts = {}
}
