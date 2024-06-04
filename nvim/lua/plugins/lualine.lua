local function modified()
    if vim.bo.modifiable == false or vim.bo.readonly == true then
        return '[-]'
    end
    if vim.bo.modified then
        return '[+]'
    end
    return '   '
end

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'catppuccin',
            globalstatus = true,
            always_divide_middle = false,
        },
        sections = {
            lualine_a = {
                {
                    modified
                }
            },
            lualine_c = {
                {

                    'filename',
                    file_status = false,   -- Displays file status (readonly status, modified status)
                    newfile_status = false, -- Display new file status (new file means no write after created)
                    path = 3,
                    shorting_target = 20, -- Shortens path to leave spaces in the window
                }
            },
            lualine_x = { 'filetype' },
            lualine_y = {},
            lualine_z = { 'location' },
        }
    }
}
