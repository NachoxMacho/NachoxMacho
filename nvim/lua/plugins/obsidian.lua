return {
    "epwalsh/obsidian.nvim",
    lazy = false,
    event = { "BufReadPre ~/Documents/docs/**.md" },
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- Optional, for completion.
        "hrsh7th/nvim-cmp",

        -- Optional, for search and quick-switch functionality.
        "nvim-telescope/telescope.nvim",

        -- Optional, an alternative to telescope for search and quick-switch functionality.
        -- "ibhagwan/fzf-lua"

        -- Optional, another alternative to telescope for search and quick-switch functionality.
        -- "junegunn/fzf",
        -- "junegunn/fzf.vim"

        -- Optional, alternative to nvim-treesitter for syntax highlighting.
        -- "godlygeek/tabular",
        -- "preservim/vim-markdown",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/personal/notes",
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        ui = {
            enable = false,
        },
        note_id_func = function(title)
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            end
            return tostring(os.time())
        end,
        wiki_link_func = "prepend_note_id",
        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["<cr>"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            },
        },
        attachments = {
            img_folder = "assets",
        },
    },
    keys = {
        { '<leader>wj', '<cmd>ObsidianToday<cr>',  desc = 'Open today note' },
        { '<leader>wt', '<cmd>ObsidianTags<cr>',  desc = 'Open tags' },
        { '<leader>ws', '<cmd>ObsidianSearch<cr>', desc = 'Search notes' },
        { '<leader>wn', '<cmd>ObsidianNew<cr>', desc = 'New Note' },
    }
}
