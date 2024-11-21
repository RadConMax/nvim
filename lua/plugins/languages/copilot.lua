return {
    'github/copilot.vim',
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true

        local which_key = require('which-key')

        which_key.add({
            { '<leader>c', desc = 'Copilot', icon  = '' },
            { '<leader>cd', ':Copilot disable<cr>', desc = 'Disable Copilot' },
            { '<leader>ce', ':Copilot enable<cr>', desc = 'Enable Copilot' },
            { '<leader>cf', ':Copilot feedback<cr>', desc = 'Send feedback to Copilot' },
            { '<leader>co', ':Copilot signout<cr>', desc = 'Sign out of Copilot' },
            { '<leader>cp', ':Copilot panel<cr>', desc = 'Open Copilot panel' },
            { '<leader>cs', ':Copilot setup<cr>', desc = 'Setup Copilot' },
            { '<leader>cv', ':Copilot version<cr>', desc = 'Show Copilot version' },
        })
        which_key.add({
            mode = 'i',
            { '<C-d>', '<Plug>(copilot-dismiss)', desc = 'Dismiss suggestion' },
            { '<C-s>', '<Plug>(copilot-next)', desc = 'Next suggestion' },
            { '<C-b>', '<Plug>(copilot-previous)', desc = 'Previous suggestion' },
            { '<C-l>', '<Plug>(copilot-accept-line)', desc = 'Accept next line suggestion' },
            { '<C-w>', '<Plug>(copilot-accept-word)', desc = 'Accept next word suggestion' },
            { '<C-y>', function() vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](), 'i', true) end, desc = 'Accept next word suggestion' },
        })
    end,
}
