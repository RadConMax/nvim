return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    lazy = false,
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')
        local which_key = require('which-key')

        mason.setup({
            ui = {
                border = 'rounded',
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'bashls',
                'cssls',
                'emmet_ls',
                'eslint',
                'helm_ls',
                'html',
                'jsonls',
                'lua_ls',
                'marksman',
                'sqlls',
                'ts_ls',
                'yamlls',
            },
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                'prettier',
                'stylua',
                'shfmt',
            },
        })

        which_key.add({
            hidden = true,
            { '<leader>MM', ':Mason<cr>', desc = 'Mason' },
        })
    end
}
