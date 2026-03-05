return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    },
    lazy = false,
    config = function()
        local lualine = require('lualine')
        local noice = require('noice')
        local theme = require('lualine.themes.dracula')

        -- Sections
        local diagnostics = { 'diagnostics', sources = { 'nvim_lsp' }, sections = { 'error', 'warn', 'info', 'hint' } }
        local filename = { 'filename', path = 1 };
        ---@diagnostic disable-next-line: undefined-field
        local recording = { noice.api.status.mode.get, cond = noice.api.status.mode.has, color = { fg = '#ff9e64' } }
        ---@diagnostic disable-next-line: undefined-field
        local commands = { noice.api.status.command.get, cond = noice.api.status.command.has }
        ---@diagnostic disable-next-line: undefined-field
        local search = { noice.api.status.search.get, cond = noice.api.status.search.has }

        lualine.setup({
            options = {
                theme = theme,
            },
            sections = {
                -- lualine_a = { 'filetype', 'copilot' },
                lualine_a = { 'filetype' },
                lualine_b = { 'encoding' },
                lualine_c = { filename },
                lualine_x = { diagnostics },
                lualine_y = { 'diff', },
                lualine_z = { 'branch' },
            },
            inactive_sections = {
                lualine_a = { 'filetype' },
                lualine_b = { 'encoding' },
                lualine_c = { filename },
                lualine_x = {},
                lualine_y = { 'diff', },
                lualine_z = { 'branch' },
            },
            winbar = {
                lualine_a = { 'mode' },
                lualine_b = { commands },
                lualine_c = { recording },
                lualine_x = { search },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
        })
    end,
}
