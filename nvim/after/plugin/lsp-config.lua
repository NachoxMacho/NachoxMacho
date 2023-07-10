
-- Azure Pipelines LSP
require('lspconfig').azure_pipelines_ls.setup {
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                    'Pipelines/*.y*l',
                    'pipelines/*.y*l',
                }
            }
        }
    }
}

-- yaml
require('lspconfig').yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                    'Pipelines/*.y*l',
                    'pipelines/*.y*l',
                }
            }
        }
    }
}
