return {
    {
        'ramilito/kubectl.nvim',
        config = function()
            require('kubectl').setup({
                auto_refresh = { enabled = false },
            })
        end,
        cmd = { 'Kubectl', 'Kubectx', 'Kubens' },
        keys = {
            -- { '<leader>k', '<cmd>lua require("kubectl").toggle()<cr>' },
        }
    }, {
        "h4ckm1n-dev/kube-utils-nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        lazy = true,
        event = "VeryLazy",
    }
}
