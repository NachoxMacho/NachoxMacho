return {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 100,
    dependencies = {
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.api.nvim_command, 'MasonUpdate')
            end,
            config = true,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        'folke/neodev.nvim',
    },
    config = function()
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            -- local nmap = function(keys, func, desc)
            --     if desc then
            --         desc = 'LSP: ' .. desc
            --     end
            --
            --     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            -- end

            vim.keymap.set("n", "<leader>nd", function() vim.lsp.buf.definition() end,
                { remap = false, buffer = bufnr, desc = 'Go to Definition' })
            vim.keymap.set("n", "<leader>nh", function() vim.lsp.buf.hover() end,
                { remap = false, buffer = bufnr, desc = 'Open Hover' })
            vim.keymap.set("n", "<leader>ns", function() vim.lsp.buf.workspace_symbol() end,
                { remap = false, buffer = bufnr, desc = 'Workspace Symbol' })
            vim.keymap.set("n", "<leader>nn", function() vim.lsp.buf.goto_next() end,
                { remap = false, buffer = bufnr, desc = 'Go to Next' })
            vim.keymap.set("n", "<leader>np", function() vim.lsp.buf.goto_prev() end,
                { remap = false, buffer = bufnr, desc = 'Go to Previous' })
            vim.keymap.set("n", "<leader>nr", function() vim.lsp.buf.rename() end,
                { remap = false, buffer = bufnr, desc = 'Rename' })
            vim.keymap.set('n', '<leader>nt', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
                { remap = false, buffer = bufnr, desc = 'Format' })
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                { remap = false, buffer = bufnr, desc = 'Signature Help' })
            vim.keymap.set('n', '<leader>nj', '<cmd>e %:h/../../package.json<cr>', { desc = 'Open package file' })

            -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            --
            -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            -- nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            --
            -- -- See `:help K` for why this keymap
            -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            --
            -- -- Lesser used LSP functionality
            -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            -- nmap('<leader>wl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, '[W]orkspace [L]ist Folders')
            --
            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local servers = {
            azure_pipelines_ls = {
                yaml = {
                    schemas = {
                        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                            "/azure-pipeline*.y*l",
                            "/*.azure*",
                            "Azure-Pipelines/**/*.y*l",
                            "[Pp]ipelines/*.y*l",
                        }
                    }
                }
            },
            clangd = {},
            dockerls = {},
            docker_compose_language_service = {},
            helm_ls = {},
            html = { filetypes = { 'html' } },
            jsonls = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false }
                }
            },
            powershell_es = {},
            tsserver = {},
            yamlls = {}
        }

        require('neodev').setup({})

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require 'mason-lspconfig'

        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end
        }


        vim.diagnostic.config({ virtual_text = true })
        vim.keymap.set('n', '<leader>nq', function() vim.diagnostic.open_float(nil, { focus = false }) end,
            { desc = 'Open Diag' })
    end
}
