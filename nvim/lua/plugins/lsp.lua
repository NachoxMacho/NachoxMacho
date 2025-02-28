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
        {
            'ray-x/go.nvim',
            build = ':lua require("go.install").update_all_sync()',
            dependencies = {
                "ray-x/guihua.lua",
                'nvim-treesitter/nvim-treesitter',
                'theHamsta/nvim-dap-virtual-text',
            }
        },
        {
            "maxandron/goplements.nvim",
            ft = "go",
            opts = {},
        },
        {
            'olexsmir/gopher.nvim',
            ft = 'go',
            dependencies = {
                'mfussenegger/nvim-dap',
            },
            build = function()
                vim.cmd.GoInstallDeps()
            end,
            opts = {}
        },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "mfussenegger/nvim-dap",
                "nvim-neotest/nvim-nio"
            }
        },
    },
    config = function()
        local on_attach = function(_, bufnr)
            vim.keymap.set("n", "gd", '<cmd>Telescope lsp_definitions <cr>',
                { remap = false, buffer = bufnr, desc = 'Go to Definition' })
            vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end,
                { remap = false, buffer = bufnr, desc = 'Open Hover' })
            vim.keymap.set("n", "ms", '<cmd> Telescope lsp_workspace_symbols <cr>',
                { remap = false, buffer = bufnr, desc = 'Workspace Symbol' })
            -- vim.keymap.set("n", "<leader>nn", function() vim.lsp.buf.goto_next() end,
            --     { remap = false, buffer = bufnr, desc = 'Go to Next' })
            -- vim.keymap.set("n", "<leader>np", function() vim.lsp.buf.goto_prev() end,
            --     { remap = false, buffer = bufnr, desc = 'Go to Previous' })
            vim.keymap.set('n', 'mi', function() vim.lsp.buf.implementation() end,
                { remap = false, buffer = bufnr, desc = 'Implementations' })
            vim.keymap.set('n', 'gr','<cmd>Telescope lsp_references<cr>',
                { remap = false, buffer = bufnr, desc = 'References' })
            vim.keymap.set("n", "mr", function() vim.lsp.buf.rename() end,
                { remap = false, buffer = bufnr, desc = 'Rename' })
            vim.keymap.set('n', 'ff', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
                { remap = false, buffer = bufnr, desc = 'Format' })
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                { remap = false, buffer = bufnr, desc = 'Signature Help' })
            vim.keymap.set('n', 'ma', vim.lsp.buf.code_action,
                { remap = false, buffer = bufnr, desc = 'Code Action' })
            vim.keymap.set('n', 'md', '<cmd>Telescope diagnostics<cr>', { remap = false, buffer = bufnr, desc = 'Diagnostics'})

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
            dockerls = {},
            docker_compose_language_service = {},
            helm_ls = {
                filetypes = { 'helm' },
                yamlls = {
                    path = "yaml-language-server",
                }
            },
            html = {
                filetypes = { 'html' },
                html = {
                },
            },
            htmx = {},
            gopls = {},
            jsonls = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    hint = { enable = true },
                }
            },
            powershell_es = {
                powershell = {
                    codeFormatting = {
                        Preset = 'OTBS',
                        AutoCorrectAliases = true,
                        AddWhitespaceAroundPipe = true,
                        UseConstantStrings = true,
                        UseCorrectCasing = true,
                        PipelineIndentationStyle = 'IncreaseIndentationForFirstPipeline',
                        WhitespaceAroundOperator = true,
                        WhitespaceBeforeOpenBrace = true,
                        WhitespaceBeforeOpenParen = true,
                        WhitespaceInsideBrace = true,
                        AlignPropertyValuePairs = true,
                        AvoidSemicolonsAsLineTerminators = true,
                        WhitespaceBetweenParameters = true,
                        IgnoreOneLineBlock = true,
                    }
                }
            },
            terraformls = { filetypes = { 'tf', 'tfvars', 'terraform' } },
            tflint = { filetypes = { 'tf', 'tfvars', 'terraform' } },
            yamlls = {}
        }

        require('neodev').setup({})

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require('mason-lspconfig')

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        require('go').setup({
            lsp_cfg = false,
            tag_options = "",

            lsp_keymaps = function(bufnr) on_attach({}, bufnr) end,
            lsp_semantic_highlights = true,
            lsp_inlay_hints = {
                enabled = false,
                style = 'eol',
            },
            trouble = false,
            luasnip = true,
        })
        mason_lspconfig.setup_handlers({
            function(server_name)
                if server_name == 'gopls' then
                    local cfg = require('go.lsp').config()
                    cfg.capabilities = require('blink.cmp').get_lsp_capabilities(cfg.capabilities)
                    cfg.on_attach = on_attach
                    require('lspconfig')["gopls"].setup(cfg)
                    return
                end
                if server_name == 'powershell_es' then
                    local installPath = require('mason-registry').get_package('powershell-editor-services')
                        :get_install_path()
                    require('lspconfig')['powershell_es'].setup({
                        bundle_path = installPath,
                        cmd = { 'pwsh', '-NoLogo', '-NoProfile',
                            '-Command', installPath .. '/PowerShellEditorServices/Start-EditorServices.ps1',
                            '-BundledModulesPath ' .. installPath,
                            '-LogPath ' .. vim.fn.stdpath('cache') .. '/powershell_es.log',
                            '-SessionDetailsPath ' .. vim.fn.stdpath('cache') .. '/powershell_es.session.json',
                            '-FeatureFlags @()',
                            '-AdditionalModules @()',
                            '-HostName nvim',
                            '-HostProfileId 0',
                            '-HostVersion 1.0.0',
                            '-Stdio',
                            '-LogLevel Normal',
                        },
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                        init_options = {
                            enableProfileLoading = false,
                        }
                    })
                    return
                end
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end
        })


        vim.diagnostic.config({ virtual_text = true, severity_sort = true, update_in_insert = true })
        vim.keymap.set('n', '<leader>nq', function() vim.diagnostic.open_float(nil, { focus = false }) end,
            { desc = 'Open Diag' })
    end
}
