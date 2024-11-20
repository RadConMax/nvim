return {
    'stevearc/dressing.nvim',
    lazy = false,
    config = function()
        local dressing = require('dressing')

        dressing.setup()
    end,
}
