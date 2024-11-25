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
            { '<m-h>', ':<C-U>TmuxNavigateLeft<cr>', desc = 'Navigate Left', icon = '󰮱' },
            { '<m-j>', ':<C-U>TmuxNavigateDown<cr>', desc = 'Navigate Down', icon = '󰮱' },
            { '<m-k>', ':<C-U>TmuxNavigateUp<cr>', desc = 'Navigate Up', icon = '󰮱' },
            { '<m-l>', ':<C-U>TmuxNavigateRight<cr>', desc = 'Navigate Right', icon = '󰮱' },
            { '<m-\\>', ':<C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate Previous', icon = '󰮱' },
        })
    end,
}
