vim.keymap.set('n', '<leader>gs', ':keepalt Gedit :<cr>')
vim.keymap.set('n', '<leader>gp', ':Git push<cr>')
vim.keymap.set('n', '<leader>gc', ':Git commit -m ""<left>')
vim.keymap.set('n', '<leader>gd', ':vert Gdiff HEAD<cr>')

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
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
