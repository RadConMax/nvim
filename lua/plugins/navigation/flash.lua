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
            { '<leader>,', flash.jump, desc = 'Flash', mode = { 'n', 'x', 'o' } },
            { '<leader>.', flash.treesitter, desc = 'Flash Treesitter', mode = { 'n', 'x', 'o' } }, -- Normal, Visual, Operator-pending
            { '<leader>;', flash.treesitter_search, desc = 'Treesitter Search', mode = { 'x', 'o' } }, -- Visual, Operator-pending
            { '<leader>\\', flash.remote, desc = 'Remote Flash', mode = { 'o' } }, -- Operator-pending
            { '<c-s>', flash.toggle, desc = 'Toggle Flash', mode = { 'c' } }, -- Command
        })
    end,
}
