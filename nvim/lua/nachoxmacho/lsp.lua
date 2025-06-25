-- This is just keybindings for when an LSP is attached
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local bufnr = ev.buf
        vim.keymap.set("n", "gd", '<cmd>Telescope lsp_definitions <cr>',
            { remap = false, buffer = bufnr, desc = 'Go to Definition' })
        vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end,
            { remap = false, buffer = bufnr, desc = 'Open Hover' })
        vim.keymap.set("n", "ms", '<cmd> Telescope lsp_dynamic_workspace_symbols <cr>',
            { remap = false, buffer = bufnr, desc = 'Workspace Symbol' })
        vim.keymap.set('n', 'mi', function() vim.lsp.buf.implementation() end,
            { remap = false, buffer = bufnr, desc = 'Implementations' })
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>',
            { remap = false, buffer = bufnr, desc = 'References' })
        vim.keymap.set("n", "mr", function() vim.lsp.buf.rename() end,
            { remap = false, buffer = bufnr, desc = 'Rename' })
        vim.keymap.set('n', 'ff', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
            { remap = false, buffer = bufnr, desc = 'Format' })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { remap = false, buffer = bufnr, desc = 'Signature Help' })
        vim.keymap.set({ 'n', 'x' }, 'ma', vim.lsp.buf.code_action,
            { remap = false, buffer = bufnr, desc = 'Code Action' })
        vim.keymap.set('n', 'md', '<cmd>Telescope diagnostics<cr>',
            { remap = false, buffer = bufnr, desc = 'Diagnostics' })
    end,
})
