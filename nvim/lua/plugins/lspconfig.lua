return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    automatic_installation = true,
    automatic_enable = true,
  },
}
