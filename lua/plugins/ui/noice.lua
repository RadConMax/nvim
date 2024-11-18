return {
    'folke/noice.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    event = 'VeryLazy',
    config = function()
        local noice = require('noice')
        local which_key = require('which-key')

        noice.setup()

        which_key.add({
            { '<leader>n', desc = 'Noice' },
            { '<leader>nc', ':NoiceDismiss<cr>', desc = 'Dismiss messages' },
            { '<leader>nd', ':NoiceDisable<cr>', desc = 'Disable Noice' },
            { '<leader>ne', ':NoiceErrors<cr>', desc = 'Error messages' },
            { '<leader>nh', ':NoiceTelescope<cr>', desc = 'Messages history' },
            { '<leader>nl', ':NoiceLast<cr>', desc = 'Last message' },
            { '<leader>nn', ':NoiceEnable<cr>', desc = 'Enable Noice' },
            { '<leader>ns', ':NoiceStats<cr>', desc = 'Debugging stats' },
        })
    end,
}
