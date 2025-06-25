return {
    'Bparsons0904/phantom-err.nvim',
    ft = 'go',
    config = function()
        require('phantom-err').setup({
            auto_enable = true,
            mode = "full",
        })
    end,
}
