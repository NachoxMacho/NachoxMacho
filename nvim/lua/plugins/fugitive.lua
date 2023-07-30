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
    if FindWindow('git_diff') == false then
        vim.cmd(':Git diff --cached')
    end
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

local function gitCommitCurrentFile()
    gitAddCurrentFile()
    if gitCommit() then
        vim.cmd(':Git push')
    end
end

return {
    'tpope/vim-fugitive',
    keys = {
        { '<leader>gp', ':Git push<cr>', desc = 'Push' },
        { '<leader>gu', ':Git pull<cr>', desc = 'Pull' },
        { '<leader>gs', toggleGit, desc = 'Status' },
        { '<leader>ga', gitAddCurrentFile, desc = 'Add current file' },
        { '<leader>gd', ':vert Gdiff HEAD<cr>', desc = 'Diff current file' },
        { '<leader>gg', gitCommitCurrentFile, desc = 'Commit current file' },
        { '<leader>gc', gitCommit, desc = 'Commit' },
        { '<leader>gb', ':Telescope git_branches<cr>', desc = 'Branches' },
        { '<leader>gl', ':Telescope git_commits<cr>', desc = 'Commit List' },
        { '<leader>gt', gitCacheView, desc = 'Staged' },
    }
}
