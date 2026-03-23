vim.keymap.set('n', '<Leader>ni', '<cmd>GoImports<cr>', { desc = 'Imports', remap = false, silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>nc', '<cmd>GoCmt<cr>', { desc = 'Go Doc Comment', remap = false, silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>ng', '<cmd>GoTestAdd<cr>',
  { desc = 'Go Add Test', remap = false, silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>na', '<cmd>GoAlt<cr>',
  { desc = 'Go Alternate file', remap = false, silent = true, buffer = 0 })
vim.keymap.set('n', "<leader>nl", function() require("neotest").run.run_last() end,
  { desc = "Rerun last test", remap = false, silent = true, buffer = 0 })
