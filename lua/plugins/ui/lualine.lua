return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    },
    lazy = false,
    config = function()
        local lualine = require('lualine')
        local theme = require('lualine.themes.palenight')

        lualine.setup({
            options = {
                theme = theme,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'copilot', 'filetype', 'branch' },
                lualine_c = {
                    'progress',
                    'location',
                    'selectioncount',
                    'searchcount',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                    },
                },
                lualine_x = { { 'filename', path = 1 } },
                lualine_y = { 'encoding', 'fileformat' },
                lualine_z = { 'hostname' },
            },
            inactive_sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'copilot', 'filetype', 'branch' },
                lualine_c = {
                    'progress',
                    'location',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                    },
                },
                lualine_x = { { 'filename', path = 1 } },
                lualine_y = { 'encoding', 'fileformat' },
                lualine_z = { 'hostname' },
            },
            winbar = {
                lualine_a = { },
                lualine_b = { },
                lualine_c = { },
                lualine_x = { },
                lualine_y = { 'diff' },
                lualine_z = { 'branch' },
            },
            inactive_winbar = {
                lualine_a = { },
                lualine_b = { },
                lualine_c = { },
                lualine_x = { },
                lualine_y = { 'diff' },
                lualine_z = { 'branch' },
            },
        })
    end,
}
