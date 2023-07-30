return {
    'nvim-telescope/telescope-fzf-native.nvim',
    depdendencies = {
        'nvim-telescope/telescope.nvim',
    },
    build = 'make',
    cond = function ()
        return vim.fn.executable 'make' == 1
    end,
    config = function ()
        require('telescope').setup({
            extensions = {
                fzf = {

                }
            }
        })
        require('telescope').load_extension('fzf')
    end
}
