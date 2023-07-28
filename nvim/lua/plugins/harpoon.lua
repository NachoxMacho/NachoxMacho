return {
    'theprimeagen/harpoon',
    keys = {
        { "<leader>aj", function() require('harpoon.mark').set_current_at(1) end, desc = 'Set Harpoon 1' },
        { "<leader>ak", function() require('harpoon.mark').set_current_at(2) end, desc = 'Set Harpoon 2' },
        { "<leader>al", function() require('harpoon.mark').set_current_at(3) end, desc = 'Set Harpoon 3' },
        { "<leader>a;", function() require('harpoon.mark').set_current_at(4) end, desc = 'Set Harpoon 4' },

        { "<leader>r", function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Quick Menu' },
        { "<leader>j", function() require('harpoon.ui').nav_file(1) end, desc = 'Harpoon 1' },
        { "<leader>k", function() require('harpoon.ui').nav_file(2) end, desc = 'Harpoon 2' },
        { "<leader>l", function() require('harpoon.ui').nav_file(3) end, desc = 'Harpoon 3' },
        { "<leader>;", function() require('harpoon.ui').nav_file(4) end, desc = 'Harpoon 4' },
    }
}
