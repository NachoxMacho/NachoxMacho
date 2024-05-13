return {
    'h4ckm1n-dev/kube-utils-nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    branch = 'main',
    config = function()
        require('helm_utils').setup()
    end,
    keys = {
        { '<leader>ko', '<cmd>OpenK9sSplit<cr>', desc = 'Open K9s' },
        { '<leader>khb', '<cmd>HelmDependencyBuildFromBuffer<cr>', desc = 'Helm Dependency build' },
        { '<leader>khu', '<cmd>HelmDependencyUpdateFromBuffer<cr>', desc = 'Helm Dependency update' }
    }

}
