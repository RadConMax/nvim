return {
    'github/copilot.vim',
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true

        local which_key = require('which-key')

        which_key.add({
            { '<leader>c', desc = 'Copilot', icon  = '' },
            { '<leader>cD', ':Copilot disable<cr>', desc = 'Disable Copilot' },
            { '<leader>cE', ':Copilot enable<cr>', desc = 'Enable Copilot' },
            { '<leader>cF', ':Copilot feedback<cr>', desc = 'Send feedback to Copilot' },
            { '<leader>cO', ':Copilot signout<cr>', desc = 'Sign out of Copilot' },
            { '<leader>cP', ':Copilot panel<cr>', desc = 'Open Copilot panel' },
            { '<leader>cS', ':Copilot setup<cr>', desc = 'Setup Copilot' },
            { '<leader>cV', ':Copilot version<cr>', desc = 'Show Copilot version' },
        })
        which_key.add({
            mode = 'i',
            { '<C-x>', '<Plug>(copilot-dismiss)', desc = 'Dismiss suggestion' },
            { '<C-j>', '<Plug>(copilot-next)', desc = 'Next suggestion' },
            { '<C-k>', '<Plug>(copilot-previous)', desc = 'Previous suggestion' },
            { '<C-y>', '<Plug>(copilot-accept-line)', desc = 'Accept next line suggestion' },
            { '<C-w>', '<Plug>(copilot-accept-word)', desc = 'Accept next word suggestion' },
            { '<C-e>', function() vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](), 'i', true) end, desc = 'Accept next suggestion' },
        })
    end,
}
