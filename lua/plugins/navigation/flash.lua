return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
        local flash = require('flash')
        local which_key = require('which-key')

        flash.setup({
            label = {
                after = false,
                before = true,
            },
            modes = {
                char = {
                    enabled = false,
                },
            },
        })

        which_key.add({
            { '<leader>j', flash.jump, desc = 'flash', mode = { 'n', 'x', 'o' }, icon = '󰉁' }, -- normal, visual, operator-pending
            { '<leader>v', flash.treesitter, desc = 'flash treesitter', mode = { 'n', 'x', 'o' }, icon = '󰉁' }, -- normal, visual, operator-pending
            { '<leader>t', flash.treesitter_search, desc = 'treesitter search', mode = { 'x', 'o' }, icon = '󰉁' }, -- visual, operator-pending
            { '<leader>r', flash.remote, desc = 'remote flash', mode = { 'o' }, icon = '󰉁' }, -- operator-pending
            { '<c-s>', flash.toggle, desc = 'toggle flash', mode = { 'c' }, icon = '󰉁' }, -- command
        })
    end,
}
