return {
    'folke/zen-mode.nvim',
    config = function()
        local zen_mode = require('zen-mode')
        local lualine = require('lualine')
        local which_key = require('which-key')

        -- lualine doesn't hide the winbar automatically with zen mode, so we need to add this extra functionality
        local show_winbar_tabs = function (unhide)
            lualine.hide({
                place = { 'tabline', 'winbar' },
                unhide = unhide,
            })
        end

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
                show_winbar_tabs(true)
            end,
        })

        which_key.add({
            { '<leader>z', desc = 'Zen Mode', icon = '' },
            {
                '<leader>zz',
                function()
                    show_winbar_tabs(false)
                    vim.cmd('ZenMode')
                end,
                desc = 'Zen Mode',
                icon = '',
            },
        })
    end,
}
