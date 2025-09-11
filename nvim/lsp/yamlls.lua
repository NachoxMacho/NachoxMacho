return {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
        ["https://json.schemastore.org/yamllint.json"] = "*.{yml,yaml}",
      },
      format = {
        enable = false
      },
    }
  }
}
