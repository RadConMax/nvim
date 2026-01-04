return {
    'github/copilot.vim',
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true

        local which_key = require('which-key')

        which_key.add({
            { '<leader>c', desc = 'Copilot', icon  = '󰚩' },
            { '<leader>cD', ':Copilot disable<cr>', desc = 'Disable Copilot', icon = '󱚧'},
            { '<leader>cE', ':Copilot enable<cr>', desc = 'Enable Copilot', icon = '󱚣' },
            { '<leader>cO', ':Copilot signout<cr>', desc = 'Sign out of Copilot', icon = '󱙺' },
            { '<leader>cP', ':Copilot panel<cr>', desc = 'Open Copilot panel', icon = '󰛾' },
            { '<leader>cS', ':Copilot setup<cr>', desc = 'Setup Copilot', icon = '' },
            { '<leader>cV', ':Copilot version<cr>', desc = 'Show Copilot version', icon = '' },
        })
        which_key.add({
            mode = 'i',
            { '<C-x>', '<Plug>(copilot-dismiss)', desc = 'Dismiss suggestion', icon = '󰅖' },
            { '<C-j>', '<Plug>(copilot-next)', desc = 'Next suggestion', icon = '' },
            { '<C-k>', '<Plug>(copilot-previous)', desc = 'Previous suggestion', icon = '' },
            { '<C-y>', '<Plug>(copilot-accept-line)', desc = 'Accept next line suggestion', icon = '' },
            { '<C-w>', '<Plug>(copilot-accept-word)', desc = 'Accept next word suggestion', icon = '' },
            { '<C-e>', function() vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](), 'i', true) end, desc = 'Accept next suggestion', icon = '' },
        })
    end,
}
