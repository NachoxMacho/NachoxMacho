vim.opt_local.wrap = true

vim.keymap.set("n", "<leader>nl", "<cmd>ZkInsertLink<cr>", { desc = "Insert Link", buffer = 0 })
vim.keymap.set("x", "<leader>nl", ":'<,'>ZkLinkFromSelectedText<cr>", { desc = "Link Text", buffer = 0} )
