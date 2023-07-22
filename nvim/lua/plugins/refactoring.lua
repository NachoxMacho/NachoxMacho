return {
    'theprimeagen/refactoring.nvim',
    opts = {},
    keys = {
        { '<leader>ri', '<Esc><Cmd>lua require("refactoring").refactor("Inline Variable")<cr>', mode = 'v', silent = true, expr = false }
    }
}
