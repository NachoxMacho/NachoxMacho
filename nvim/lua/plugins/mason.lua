return {
    'mason-org/mason.nvim',
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    },
    build = ':MasonUpdate',
    cmd = {
        'Mason',
        'MasonInstall',
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
    },
}
