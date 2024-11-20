return {
    'folke/twilight.nvim',
    config = function()
        local twilight = require('twilight')
        local which_key = require('which-key')

        twilight.setup()

        which_key.add({
            { '<leader>t', desc = 'Twilight', icon = '󰱌' },
            { '<leader>tt', ':Twilight<cr>', desc = 'Twilight', icon = '󰱌' },
        })
    end,
}
