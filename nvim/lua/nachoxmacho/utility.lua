
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
