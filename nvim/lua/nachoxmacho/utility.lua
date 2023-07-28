
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

local function makeDir(_)
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
    end
end

vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufWritePre' },
    {
        callback = makeDir
    }
)
