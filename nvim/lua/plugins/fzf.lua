local makeCommand = 'make'
if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 or vim.fn.has('win16') == 1 then
    makeCommand = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
end

return {
    'nvim-telescope/telescope-fzf-native.nvim',
    depdendencies = {
        'nvim-telescope/telescope.nvim',
    },
    build = makeCommand,
    config = function ()
        require('telescope').setup({
            extensions = {
                fzf = {

                }
            }
        })
        require('telescope').load_extension('fzf')
    end
}
