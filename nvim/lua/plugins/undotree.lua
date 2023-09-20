return {
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
        local target_path = os.getenv('HOME') .. '/.config/nvim-data/undodir'
        if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 or vim.fn.has('win16') == 1 then
            target_path = os.getenv('LocalAppData') .. '/nvim-data/undodir'
        end
        if (vim.fn.isdirectory(target_path) ~= 0) then
            vim.fn.mkdir(target_path, 'p')
        end
        vim.opt.undodir = target_path
    end,
    keys = {
        { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Undotree' }
    }
}
