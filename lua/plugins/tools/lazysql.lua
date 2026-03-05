return {
    'LostbBlizzard/lazysql.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    config = function()
        local which_key = require('which-key')

        which_key.add({
            hidden = true,
            { '<leader>dd', ':LazySql<cr>', desc = 'LazySql' },
        })
    end,
}
