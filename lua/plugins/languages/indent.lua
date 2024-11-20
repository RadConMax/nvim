return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
        local indent_blankline = require('ibl')

        indent_blankline.setup({
            scope = {
                show_start = false,
                show_end = false,
            },
        })
    end,
}
