
function FindWindow(variableName)
    local windows = vim.api.nvim_list_wins()
    for _, win in ipairs(windows) do
        local s, _ = pcall(vim.api.nvim_win_get_var, win, variableName)
        if s and vim.api.nvim_win_is_valid(win) then
            return win
        end
    end
    return false
end

local function makeDir(args)
    local s, index = string.find(args.file, '.*/')
    local dir = string.sub(args.file, 0, index - 1)
    vim.print(dir)
    if vim.fs.find(dir) == 1 then
        return
    end
    if vim.fn.isdirectory(dir) then
        vim.fn.mkdir(dir, 'p')
    end
end

vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufWritePre' },
    {
        callback = makeDir
    }
)
