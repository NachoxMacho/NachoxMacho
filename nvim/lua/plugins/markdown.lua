return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function ()
        require('render-markdown').setup({
            paragraph = {
                enabled = true,
                left_margin = 0,
                min_width = 0,
            },
            latex = {
                enabled = false
            }
                    })
    end
}
