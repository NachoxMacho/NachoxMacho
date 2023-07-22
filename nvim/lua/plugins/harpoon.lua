local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

return {
    'theprimeagen/harpoon',
    keys = {
        { "<leader>aj", function() mark.set_current_at(1) end, desc = 'Set Harpoon 1' },
        { "<leader>ak", function() mark.set_current_at(2) end, desc = 'Set Harpoon 2' },
        { "<leader>al", function() mark.set_current_at(3) end, desc = 'Set Harpoon 3' },
        { "<leader>a;", function() mark.set_current_at(4) end, desc = 'Set Harpoon 4' },

        { "<leader>r", ui.toggle_quick_menu, desc = 'Quick Menu' },
        { "<leader>j", function() ui.nav_file(1) end, desc = 'Harpoon 1' },
        { "<leader>k", function() ui.nav_file(2) end, desc = 'Harpoon 2' },
        { "<leader>l", function() ui.nav_file(3) end, desc = 'Harpoon 3' },
        { "<leader>;", function() ui.nav_file(4) end, desc = 'Harpoon 4' },
    }
}



