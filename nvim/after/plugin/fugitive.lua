vim.keymap.set('n', '<leader>gp', ':Git push<cr>', { desc = 'Git Push' })
vim.keymap.set('n', '<leader>gu', ':Git pull<cr>', { desc = 'Git Pull' })

require('nachoxmacho.utility')

local function findGitWindow()
    return FindWindow('fugitive_status')
end

local function openGit()
    vim.cmd(':Git') -- Open small window of git at the below
end

local function closeGit()
    local gitWindow = findGitWindow()
    if gitWindow ~= false then
        vim.api.nvim_win_close(gitWindow, true)
    end
    return gitWindow ~= nil
end

local function toggleGit()
    local gitWindow = findGitWindow()
    if gitWindow == false then
        openGit()
    else
        vim.api.nvim_win_close(gitWindow, true)
    end
end

local function gitCacheView()
    local gitWindow = FindWindow('git_diff')
    if gitWindow == false then
        vim.cmd(':Git diff --cached')
        vim.api.nvim_win_set_var(0, 'git_diff', 'true')
    else
        vim.api.nvim_win_close(gitWindow, true)
    end
end

local function gitCommit()
    closeGit()
    vim.cmd(':Git diff --cached')
    vim.cmd(':redraw') -- Need this so the window appears before input
    local message = vim.fn.input('Message > ')
    local commit = false
    if message ~= nil and message ~= '' then
        vim.cmd(':Git commit -m "' .. message .. '"')
        commit = true
    else
        vim.print('No commit made, empty message')
    end
    vim.api.nvim_win_close(0, true)
    return commit
end

local function gitAddCurrentFile()
    local curFile = vim.api.nvim_buf_get_name(0)
    vim.cmd(':Git add ' .. curFile)
end


vim.keymap.set('n', '<leader>gs', toggleGit, { desc = 'Open Git Status' })
vim.keymap.set('n', '<leader>ga', gitAddCurrentFile, { desc = 'Add current file' })
vim.keymap.set('n', '<leader>gc', gitCommit, { desc = 'Commit' })
vim.keymap.set('n', '<leader>gd', ':vert Gdiff HEAD<cr>', { desc = 'Diff current file' })
vim.keymap.set('n', '<leader>gg', function()
    gitAddCurrentFile()
    if gitCommit() then
        vim.cmd(':Git push')
    end
end, { desc = 'Stage current file and commit' })
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<cr>', { desc = 'Switch Branch' })
vim.keymap.set('n', '<leader>gl', ':Telescope git_commits<cr>', { desc = 'Search Commit Log' })
vim.keymap.set('n', '<leader>gt', gitCacheView, { desc = 'Preview commit' })
