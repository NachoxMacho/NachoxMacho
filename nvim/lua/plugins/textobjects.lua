return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {

                        ["af"] = { query = "@function.outer", desc = "Function Outer" },
                        ["if"] = { query = "@function.inner", desc = "Function Inner" },

                        ["av"] = { query = "@parameter.outer", desc = "Parameter Outer" },
                        ["iv"] = { query = "@parameter.inner", desc = "Parameter Inner" },

                        ["aa"] = { query = "@assignment.outer", desc = "Assignment Outer" },
                        ["ia"] = { query = "@assignment.inner", desc = "Assignment Inner" },
                        ["ih"] = { query = "@assignment.lhs", desc = "Assignment LHS" },
                        ["il"] = { query = "@assignment.rhs", desc = "Assignment RHS" },

                        ["ac"] = { query = "@conditional.outer", desc = "Select outer part of a class region" },
                        ["ic"] = { query = "@conditional.inner", desc = "Select inner part of a class region" },

                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = false, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["[m"] = { query = "@function.outer", desc = "Next Function start" },
                        ["[["] = { query = "@class.outer", desc = "Next class start" },
                        ["[v"] = { query = "@parameter.outer", desc = "Next parameter start" },

                        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                        ["[o"] = "@loop.*",
                        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                        --
                        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        ["[s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                        ["[V"] = "@parameter.outer",
                    },
                    goto_previous_start = {
                        ["]m"] = "@function.outer",
                        ["]["] = "@class.outer",
                        ["]v"] = "@parameter.outer",
                    },
                    goto_previous_end = {
                        ["]M"] = "@function.outer",
                        ["]]"] = "@class.outer",
                        ["]V"] = "@parameter.outer",
                    },
                    -- -- Below will go to either the start or the end, whichever is closer.
                    -- -- Use if you want more granular movements
                    -- -- Make it even more gradual by adding multiple queries and regex.
                    -- goto_next = {
                    --     ["]d"] = "@conditional.outer",
                    -- },
                    -- goto_previous = {
                    --     ["[d"] = "@conditional.outer",
                    -- }
                },
            }
        })

        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

        -- Repeat movement with ; and ,
        -- ensure ; goes forward and , goes backward regardless of the last direction
        -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

        -- vim way: ; goes to the direction you were moving.
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

        -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr)
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr)
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr)
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr)
    end
}
