return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    automatic_enable = true,
    ensure_installed = {
      'gopls',
      'golangci_lint_ls',
      'helm_ls',
      'bashls',
      'yamlls',
      'lua_ls',
    }
  },
}
