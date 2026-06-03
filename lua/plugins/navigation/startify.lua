return {
    'mhinz/vim-startify',
    dependencies = { 'folke/which-key.nvim' },
    config = function()
        vim.g.ascii = {
            ' _______             ____   ____.__         ',
            ' ╲      ╲   ____  ___╲   ╲ ╱   ╱│__│ _____  ',
            ' ╱   │   ╲_╱ __ ╲╱  _ ╲   Y   ╱ │  │╱     ╲ ',
            '╱    │    ╲  ___(  <_> )     ╱  │  │  Y Y  ╲',
            '╲____│__  ╱╲___  >____╱ ╲___╱   │__│__│_│  ╱',
            ' ╲╱     ╲╱                               ╲╱ ',
            '                                            ',
        }
        vim.g.startify_custom_header = 'map(g:ascii + startify#fortune#boxed(), "\\" \\".v:val")'
        vim.g.startify_lists = {
            { type = 'sessions', header = { '   Sessions' } },
            { type = 'bookmarks', header = { '   Bookmarks' } },
            { type = 'files', header = { '   MRU' } },
            { type = 'dir', header = { '   Current Directory' } },
            { type = 'commands', header = { '   Commands' } },
        }

        local which_key = require('which-key')

        which_key.add({
            { '<leader>S', desc = 'Session', icon = '' },
            { '<leader>SC', ':SClose<cr>', desc = 'Close session', icon = '󰅖' },
            { '<leader>SD', ':SDelete<cr>', desc = 'Delete session', icon = '󰆴' },
            { '<leader>SL', ':SLoad<cr>', desc = 'Load session', icon = '' },
            { '<leader>SN', ':SSave<cr>', desc = 'New session', icon = '' },
        })
    end,
}
