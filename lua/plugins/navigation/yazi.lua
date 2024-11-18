return {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    config = function()
        local yazi = require('yazi')
        local which_key = require('which-key')

        yazi.setup({
            open_for_directories = true,
            floating_window_scaling_factor = 0.95,
            keymaps = {
                show_help = '<f1>',
            },
        })

        which_key.add({
            { '<leader>y', desc = 'Yazi', icon = '' },
            { '<leader>yy', ':Yazi toggle<cr>', desc = 'Yazi (toggle)', icon = '' },
            { '<leader>yc', ':Yazi<cr>', desc = 'Yazi (current file)', icon = '' },
            { '<leader>yd', ':Yazi cwd<cr>', desc = 'Yazi (current working directory)', icon = '' },
        })
    end,
}
