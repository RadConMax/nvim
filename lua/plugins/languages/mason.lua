return {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' }, -- Bridges mason.nvim with the lspconfig plugin
    lazy = false,
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
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
                'cssls',
                'emmet_ls',
                'eslint',
                'html',
                'lua_ls',
                'marksman',
                'sqlls',
                'tailwindcss',
                'ts_ls',
                'yamlls',
            },
            automatic_installation = true,
        })

        which_key.add({
            hidden = true,
            { '<leader>MM', ':Mason<cr>', desc = 'Mason' },
        })
    end
}
