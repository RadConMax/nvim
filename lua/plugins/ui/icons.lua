return {
    'echasnovski/mini.icons',
    lazy = false,
    priority = 900,
    config = function()
        local icons = require('mini.icons')
        icons.setup()
        icons.mock_nvim_web_devicons()
    end,
}
