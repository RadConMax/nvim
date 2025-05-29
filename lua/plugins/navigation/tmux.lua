return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    init = function()
        local which_key = require('which-key')

        which_key.add({
            hidden = true,
            { '<c-h>', ':<C-U>TmuxNavigateLeft<cr>', desc = 'Navigate to left', icon = '󰮱' },
            { '<c-j>', ':<C-U>TmuxNavigateDown<cr>', desc = 'Navigate to down', icon = '󰮱' },
            { '<c-k>', ':<C-U>TmuxNavigateUp<cr>', desc = 'Navigate to up', icon = '󰮱' },
            { '<c-l>', ':<C-U>TmuxNavigateRight<cr>', desc = 'Navigate to right', icon = '󰮱' },
            { '<c-\\>', ':<C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate to previous', icon = '󰮱' },
        })
    end,
}
