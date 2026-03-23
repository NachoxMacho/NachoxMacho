return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('nvim-treesitter-textobjects').setup({
      lookahead = true,
    })

    local select = require("nvim-treesitter-textobjects.select")

    vim.keymap.set({'x','o'}, 'af', function() select.select_textobject("@function.outer", "textobjects") end)
    vim.keymap.set({'x','o'}, 'if', function() select.select_textobject("@function.inner", "textobjects") end)

    vim.keymap.set({'x','o'}, 'av', function() select.select_textobject("@parameter.outer", "textobjects") end)
    vim.keymap.set({'x','o'}, 'iv', function() select.select_textobject("@parameter.inner", "textobjects") end)

    vim.keymap.set({'x','o'}, 'aa', function() select.select_textobject("@assignment.outer", "textobjects") end)
    vim.keymap.set({'x','o'}, 'ia', function() select.select_textobject("@assignment.inner", "textobjects") end)
    vim.keymap.set({'x','o'}, 'ah', function() select.select_textobject("@assignment.lhs", "textobjects") end)
    vim.keymap.set({'x','o'}, 'al', function() select.select_textobject("@assignment.rhs", "textobjects") end)
  end
}
