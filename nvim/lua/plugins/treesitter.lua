return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    config = function ()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'go',
                'markdown',
                'gitignore',
                'yaml',
                'html',
                'json',
                'vim',
                'vimdoc',
                'lua',
                'c',
                'markdown_inline',
                'gomod',
                'gosum',
                'gowork',
                'sql',
                'gotmpl',
                'templ',
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            }
        })
    end
}
