vim.keymap.set('n', '<leader>gs', ':keepalt Gedit :<cr>', { desc = 'Open Git Status Message' })
vim.keymap.set('n', '<leader>gp', ':Git push<cr>', { desc = 'Git Push' })
vim.keymap.set('n', '<leader>gu', ':Git pull<cr>', { desc = 'Git Pull' })
vim.keymap.set('n', '<leader>gc', ':Git commit -m ""<left>', { desc = 'Git Commit' })
vim.keymap.set('n', '<leader>gd', ':vert Gdiff HEAD<cr>', { desc = 'Git Diff current file' })

local NachoxMacho_Fugutive = vim.api.nvim_create_augroup("NachoxMacho_Fugutive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = NachoxMacho_Fugutive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
