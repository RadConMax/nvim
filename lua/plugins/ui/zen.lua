return {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    dependencies = { 'folke/which-key.nvim' },
    init = function()
        local which_key = require('which-key')

        which_key.add({
            { '<leader>z', desc = 'Zen Mode', icon = '' },
            {
                '<leader>zz',
                function()
                    local lualine = require('lualine')
                    lualine.hide({
                        place = { 'tabline', 'winbar' },
                        unhide = false,
                    })
                    vim.cmd('ZenMode')
                end,
                desc = 'Zen Mode',
                icon = '',
            },
        })
    end,
    config = function()
        local zen_mode = require('zen-mode')
        local lualine = require('lualine')

        zen_mode.setup({
            window = {
                backdrop = 1,
                width = 1,
                height = 1,
                options = {
                    signcolumn = 'no',
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = '0',
                    list = false,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true,
                    showcmd = true,
                    laststatus = 1,
                },
                twilight = { enabled = false },
                gitsigns = { enabled = true },
                tmux = { enabled = true },
            },
            on_close = function()
                lualine.hide({
                    place = { 'tabline', 'winbar' },
                    unhide = true,
                })
            end,
        })
    end,
}
