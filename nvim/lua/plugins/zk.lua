local function missingLinks()
    local curFilePath = vim.api.nvim_buf_get_name(0)
    local curFile = vim.fs.basename(curFilePath)

    -- local lines = vim.fn.system({ "zk", "vim-qf-unlinked", curFile })
    local lines = vim.fn.systemlist({ "zk", "vim-qf-unlinked", curFile })
    for s in lines do
        print(s)
        -- for c in s do
        --     print(c)
        -- end
        -- local t = string.find(s, '\033')
        -- print(t)
    end
end

return {
    {
        "zk-org/zk-nvim",
        lazy = false,
        config = function()
            require("zk").setup({
                picker = "telescope",
                lsp = {
                    config = {
                        name = "zk",
                        cmd = { "zk", "lsp" },
                        filetypes = { "markdown" },
                        root_markers = { ".zk" },
                    },
                    auto_attach = {
                        filetypes = { "markdown" },
                        enabled = true,
                    },
                }
            })

            local commands = require('zk.commands')
            local util = require('zk.util')
            local zk = require('zk')
            local api = require('zk.api')

            commands.add('ZkLinkFromSelectedText', function(opts)
                opts = opts or {}
                local location = util.get_lsp_location_from_selection()
                local selected_text = util.get_selected_text()

                assert(selected_text ~= nil, "No Selected Text")

                if opts['match'] then
                    opts = vim.tbl_extend('force', { match = { selected_text } }, opts or {})
                end

                opts['aliases'] = true

                zk.pick_notes(opts, { multi_select = false, telescope = { default_text = selected_text } },
                    function(note)
                        assert(note ~= nil, "Something dum dum")

                        api.link(note.path, location, nil,
                            { title = selected_text },
                            function(err, foo)
                                if not foo then
                                    error(err)
                                end
                            end)
                    end)
            end, { needs_selection = true })

            vim.keymap.set("n", "<leader>nf", "<cmd>ZkNotes { aliases = true }<CR>", { desc = "Find Note" })
            -- vim.keymap.set("n", "<leader>nt", missingLinks, { desc = "missing links" })
            vim.keymap.set("n", "<leader>nn", "<cmd>ZkNew<CR>", { desc = "New Note" })
        end
    }
}
