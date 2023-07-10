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

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- lsp


local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<enter>'] = cmp.mapping.confirm({ select = true }),
  ["<C-space>"] = cmp.mapping.complete(),
})

if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 or vim.fn.has('win16') == 1 then
    cmp_mappings['<C-k>'] = cmp.mapping.complete()
else
    cmp_mappings['<C-Space>'] = cmp.mapping.complete()
end

lsp.setup_nvim_cmp({
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
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

