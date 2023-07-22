return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd('colorscheme catppuccin')
    end
}
-- function ColorMyPencils(color)
-- 	color = color or "catppuccin"
-- 	vim.cmd.colorscheme(color)

-- end

-- ColorMyPencils()
