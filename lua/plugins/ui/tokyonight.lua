return {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    config = function()
        local tokyonight = require('tokyonight')

        tokyonight.setup({
            transparent = true,
            styles = {
                sidebars = 'transparent',
                floats = 'transparent',
            },
            on_highlights = function(hl, c)
                local nr = {
                    fg = c.magenta,
                }

                hl.Comment = {
                    fg = '#888888',
                    italic = true,
                }
                hl.CursorLineNr = {
                    fg = c.magenta2,
                }
                hl.LineNr = nr
                hl.LineNrAbove = nr
                hl.LineNrBelow = nr
            end,
        })

        vim.cmd.colorscheme('tokyonight-moon')
    end,
}
