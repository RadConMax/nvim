return {
    'folke/twilight.nvim',
    cmd = { 'Twilight' },
    dependencies = { 'folke/which-key.nvim' },
    init = function()
        local which_key = require('which-key')

        which_key.add({
            { '<leader>t', desc = 'Twilight', icon = '󰱌' },
            { '<leader>tt', ':Twilight<cr>', desc = 'Twilight', icon = '󰱌' },
        })
    end,
    config = function()
        require('twilight').setup()
    end,
}
