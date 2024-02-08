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
        },
        sections = {
            lualine_a = {
                {
                    modified
                }
            },
            lualine_c = {
                'mode'
            },
            lualine_x = { 'filetype' },
            lualine_y = {},
            lualine_z = { 'location' },
        }
    }
}
