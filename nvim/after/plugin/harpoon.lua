local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>aj", function() mark.set_current_at(1) end)
vim.keymap.set("n", "<leader>ak", function() mark.set_current_at(2) end)
vim.keymap.set("n", "<leader>al", function() mark.set_current_at(3) end)
vim.keymap.set("n", "<leader>a;", function() mark.set_current_at(4) end)
vim.keymap.set("n", "<leader>r", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end, { desc = 'Harpoon 1' })
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end, { desc = 'Harpoon 2' })
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end, { desc = 'Harpoon 3' })
vim.keymap.set("n", "<leader>;", function() ui.nav_file(4) end, { desc = 'Harpoon 4' })


