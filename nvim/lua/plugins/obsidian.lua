return {
    "NachoxMacho/obsidian.nvim",
    branch = 'feature/convert-to-logseq',
    lazy = true,
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
        "godlygeek/tabular",
        "preservim/vim-markdown",
    },
    opts = {
        dir = "~/Documents/docs", -- no need to call 'vim.fn.expand' here
        notes_subdir = 'pages',
        completion = {
            nvim_cmp = true,
            new_notes_location = 'notes_subdir',
            min_chars = 0,
            prepend_note_id = false,
        },
        daily_notes = {
            folder = 'journals',
            date_format = "%Y_%m_%d",
        },
        templates = {
            subdir = 'templates',
            date_format = '%Y_%m_%d',
        },
        disable_frontmatter = true,
        note_func_id = function(_)
            return ''
        end
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
        -- see also: 'follow_url_func' config option below.
        vim.keymap.set("n", "gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'markdown', 'markdown_inline' },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'markdown' }
            }
        })
    end,
    keys = {
        { '<leader>wj', '<cmd>ObsidianToday<cr>',  desc = 'Open today note' },
        { '<leader>ws', '<cmd>ObsidianSearch<cr>', desc = 'Search notes' }
    }
}
