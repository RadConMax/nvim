return {
    'folke/which-key.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    lazy = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local which_key = require('which-key')

        which_key.setup({
            icons = {
                group = vim.g.icons_enabled and '' or '+', separator = ""
            },
            disable = {
                filetypes = {
                    'TelescopePrompt'
                },
            },
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
            },
        })
        which_key.add({
            hidden = true,
            { '<leader>kk', ':WhichKey<cr>', desc = 'Which Key (Open)' },
        })
    end,
}
