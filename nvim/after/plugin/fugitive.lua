vim.keymap.set('n', '<leader>gp', ':Git push<cr>', { desc = 'Git Push' })
vim.keymap.set('n', '<leader>gu', ':Git pull<cr>', { desc = 'Git Pull' })

local function findGitWindow()
    local windows = vim.api.nvim_list_wins()
    for _, handle in ipairs(windows) do
        local s, _ = pcall(vim.api.nvim_win_get_var, handle, 'fugitive_status')
        if s and vim.api.nvim_win_is_valid(handle) then
            return handle
        end
    end
    return false
end

local function openGit()
    vim.cmd(':Git!') -- Open small window of git at the below
end

local function closeGit()
    local gitWindow = findGitWindow()
    if gitWindow ~= nil then
        vim.api.nvim_win_close(gitWindow, true)
    end
    return gitWindow ~= nil
end

local function toggleGit()
    local gitWindow = findGitWindow()
    if gitWindow == false then
        openGit()
    else
        -- closeGit()
        vim.api.nvim_win_close(gitWindow, true)
    end
end

local function gitCommit()
    local message = vim.fn.input('Message > ')
    if message ~= nil and message ~= '' then
        vim.cmd(':Git commit -m "' .. message .. '"')
    else
        vim.print('No commit made, empty message')
    end
end

vim.keymap.set('n', '<leader>gs', toggleGit, { desc = 'Open Git Status'})
vim.keymap.set('n', '<leader>gc', gitCommit, { desc = 'Commit' })
vim.keymap.set('n', '<leader>gd', ':vert Gdiff HEAD<cr>', { desc = 'Diff current file' })
vim.keymap.set('n', '<leader>gf', function ()
    local curFile = vim.api.nvim_buf_get_name(0)
    vim.cmd(':Git add ' .. curFile)
    gitCommit()
end, { desc = 'Stage current file and commit' })
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<cr>', { desc = 'Switch Branch'})
vim.keymap.set('n', '<leader>gl', ':Telescope git_commits<cr>', { desc = 'Search Commit Log'})

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
        -- vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
