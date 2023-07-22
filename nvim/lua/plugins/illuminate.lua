return {
    'RRethy/vim-illuminate',
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
        require('illuminate').configure({ under_cursor = true })
    end
}
