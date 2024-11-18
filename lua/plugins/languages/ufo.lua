return {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'VeryLazy',
    run = ':TSUpdate',
    config = function()
        local ufo = require('ufo')
        local which_key = require('which-key')

        ufo.setup({
            provider_selector = function()
                return { 'treesitter', 'indent' }
            end,
        })

        which_key.add({
            { 'zM', ufo.closeAllFolds, desc = 'Close all folds', icon = '' },
            { 'zR', ufo.openAllFolds, desc = 'Open all folds', icon = '' },
        })
    end,
}
