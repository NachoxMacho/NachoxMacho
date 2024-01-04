return {
    'mbbill/undotree',
    config = function ()
        vim.keymap.set('n', '<leader>fu', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
    end
}
