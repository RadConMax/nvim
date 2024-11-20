return {
    'folke/zen-mode.nvim',
    config = function()
        local zen_mode = require('zen-mode')
        local which_key = require('which-key')

        zen_mode.setup({
            window = {
                backdrop = 1,
                width = 1,
                height = 1,
                options = {
                    signcolumn = 'no',
                    number = false,
                    relativenumber = false,
                    -- cursorline = false,
                    -- cursorcolumn = false,
                    -- foldcolumn = '0',
                    -- list = false,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true,
                    showcmd = true,
                    laststatus = 1,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = true },
                tmux = { enabled = true },
            },
        })

        which_key.add({
            { '<leader>z', desc = 'Zen Mode', icon = '' },
            { '<leader>zz', ':ZenMode<cr>', desc = 'Zen Mode', icon = '' },
        })
    end,
}
