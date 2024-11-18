return {
    'otavioschwanck/arrow.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local arrow = require('arrow')
        local which_key = require('which-key')

        arrow.setup({
            show_icons = true,
            leader_key = ' aa',
        })

        which_key.add({
            { '<leader>a', desc = 'Arrow', icon = '󱡁' },
            { '<leader>aa', desc = 'List all arrowed files' },
        })
    end,
}
