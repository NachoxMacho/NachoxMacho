return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ':TSUpdate',
    config = function ()
         require('nvim-treesitter.configs').setup({
            ensure_installed = { 'vimdoc', 'javascript', 'typescript', 'c', 'lua', 'tsx' },
            sync_install = false,
            auto_install = true,
            modules = {},
            ignore_install = {},
            hightlight = {
                enable =  true,
                additional_vim_regex_highlighting = false,
            }
        })
        if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 or vim.fn.has('win16') == 1 then
            require 'nvim-treesitter.install'.compilers = { 'clang' }
        end
    end
},
{
    'nvim-treesitter/nvim-treesitter-context'
}

