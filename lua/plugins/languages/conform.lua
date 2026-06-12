return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
        local conform = require('conform')
        local which_key = require('which-key')

        conform.setup({
            formatters_by_ft = {
                css = { 'prettier' },
                html = { 'prettier' },
                javascript = { 'prettier' },
                javascriptreact = { 'prettier' },
                json = { 'prettier' },
                lua = { 'stylua' },
                markdown = { 'prettier' },
                sh = { 'shfmt' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                yaml = { 'prettier' },
            },
            format_on_save = {
                timeout_ms = 3000,
                lsp_format = 'fallback',
            },
        })

        which_key.add({
            { '<leader>lf', function() conform.format({ async = true, lsp_format = 'fallback' }) end, desc = 'Format file' },
        })
    end,
}
