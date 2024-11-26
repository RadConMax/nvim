local which_key = require('which-key')

-- Which key mappings
which_key.add({
    -- Set filetype
    { '<leader>F',desc = 'Filetype', icon = '' },
    { '<leader>Fj', ':set filetype=json<cr>', desc = 'JSON', icon = '' },
    { '<leader>Fl', ':set filetype=lua<cr>', desc = 'Lua', icon = '' },
    { '<leader>Fm', ':set filetype=markdown<cr>', desc = 'Markdown', icon = '' },
    { '<leader>Fp', ':set filetype=python<cr>', desc = 'Python', icon = '' },
    { '<leader>Fq', ':set filetype=sql<cr>', desc = 'SQL', icon = '' },
    { '<leader>Fs', ':set filetype=sh<cr>', desc = 'Shell', icon = '' },
    { '<leader>Ft', ':set filetype=typescript<cr>', desc = 'TypeScript', icon = '' },
    { '<leader>Fv', ':set filetype=javascript<cr>', desc = 'JavaScript', icon = '' },
})
which_key.add({
    hidden = true,
    {
        -- Text edit
        { 'J', 'mzJ`z', desc = 'Append next line to current line', icon = '' },
        { 'N', 'Nzzzv', desc = 'Search next but keep cursor centered', icon = '' },
        -- Navigation
        { '<c-h>', ':<C-U>TmuxNavigateLeft<cr>', desc = 'Navigate to left', icon = '󰮱' },
        { '<c-j>', ':<C-U>TmuxNavigateDown<cr>', desc = 'Navigate to down', icon = '󰮱' },
        { '<c-k>', ':<C-U>TmuxNavigateUp<cr>', desc = 'Navigate to up', icon = '󰮱' },
        { '<c-l>', ':<C-U>TmuxNavigateRight<cr>', desc = 'Navigate to right', icon = '󰮱' },
        { '<c-\\>', ':<C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate to previous', icon = '󰮱' },
        { '<c-d>', '<C-d>zz', desc = 'Move half page down but keep cursor centered', icon = '󰮱' },
        { '<c-u>', '<C-u>zz', desc = 'Move half page up but keep cursor centered', icon = '󰮳' },
        { '<leader>cc', ':qa<cr>', desc = 'Exit', icon = '󱎘' },
        { '<leader>hh', ':split<cr>', desc = 'Horizontal split', icon = '' },
        { '<leader>qq', ':q<cr>', desc = 'Buffer (Close)', icon = '󱎘' },
        { '<leader>QQ', ':q!<cr>', desc = 'Buffer (Force Close)', icon = '󱎘' },
        { '<leader>rr', ':so<cr>', desc = 'Source current file' },
        { '<leader>ss', ':w<cr>', desc = 'Save', icon = '' },
        { '<leader>SS', ':w!<cr>', desc = 'Save (Force)', icon = '' },
        { '<leader>xx', ':x<cr>', desc = 'Save and close (if modified)', icon = ' 󱎘' },
        { '<leader>vv', ':vsplit<cr>', desc = 'Vertical split', icon = '' },
        { '<leader>VV', 'ggVG', desc = 'Select all', icon = '󰒆' },
        { '<leader>ww', ':windo diffthis<cr>', desc = 'Diff', icon = '' },
        { '<Esc>', ':noh<cr>', desc = 'Close highlights', icon = '󱎘' },
        { '[q', ':cp<cr>', desc = 'Previous quickfix item', icon = '' },
        { ']q', ':cn<cr>', desc = 'Next quickfix item', icon = '' },
        { 'n', 'nzzzv', desc = 'Search previous but keep cursor centered', icon = '' },
    },
    {
        -- Tools
        { '<leader>ll', ':Lazy<cr>', desc = 'Lazy (Open)', icon = '󰀻' },
    },
})
which_key.add({
    mode = { 'v' },
    -- Text edit
    { 'J', ':m \'>+1<CR>gv=gv', desc = 'Move selected line up', icon = '' },
    { 'K', ':m \'<-2<CR>gv=gv', desc = 'Move selected line down', icon = '' },
})
