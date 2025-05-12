return {
    {
        'olexsmir/gopher.nvim',
        ft = 'go',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        build = function()
            vim.cmd.GoInstallDeps()
        end,
        opts = {}
    },
}
