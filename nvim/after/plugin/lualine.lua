require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
                file_status = true,
            }
        },
        lualine_c = {
            'mode'
        },
    },
}
