local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'azure_pipelines_ls',
    'clangd',
    'dockerls',
    'docker_compose_language_service',
    'helm_ls',
    'jsonls',
    'lua_ls',
    'powershell_es',
    'sqlls',
    'tsserver',
    'yamlls',
})

lsp.nvim_workspace()

local cmp = require('cmp')
local actions = require('lsp-zero').cmp_action()
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<enter>'] = cmp.mapping.confirm({ select = true }),
  ['<C-k>'] = actions.toggle_completion(),
  ['<C-f>'] = cmp.mapping.close(),
})


cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
    },
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    },
})

lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "<leader>nd", function() vim.lsp.buf.definition() end, { remap = false, buffer = bufnr, desc = 'Go to Definition' })
  vim.keymap.set("n", "<leader>nh", function() vim.lsp.buf.hover() end, { remap = false, buffer = bufnr, desc = 'Open Hover' })
  vim.keymap.set("n", "<leader>ns", function() vim.lsp.buf.workspace_symbol() end, { remap = false, buffer = bufnr, desc = 'Workspace Symbol' })
  vim.keymap.set("n", "<leader>no", function() vim.lsp.buf.open_float() end, { remap = false, buffer = bufnr, desc = 'Open Float' })
  vim.keymap.set("n", "<leader>nn", function() vim.lsp.buf.goto_next() end, { remap = false, buffer = bufnr, desc = 'Go to Next' })
  vim.keymap.set("n", "<leader>np", function() vim.lsp.buf.goto_prev() end, { remap = false, buffer = bufnr, desc = 'Go to Previous' })
  vim.keymap.set("n", "<leader>na", function() vim.lsp.buf.code_action() end, { remap = false, buffer = bufnr, desc = 'Code Actions' })
  vim.keymap.set("n", "<leader>ng", function() vim.lsp.buf.references() end, { remap = false, buffer = bufnr, desc = 'Open References' })
  vim.keymap.set("n", "<leader>nr", function() vim.lsp.buf.rename() end, { remap = false, buffer = bufnr, desc = 'Rename' })
  vim.keymap.set('n', '<leader>nf', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000}) end, { remap = false, buffer = bufnr, desc = 'Format'})
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { remap = false, buffer = bufnr, desc = 'Signature Help' })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

vim.keymap.set('n', '<leader>nq', function() vim.diagnostic.open_float(nil, {focus=false}) end, { desc = 'Open Diag'})
