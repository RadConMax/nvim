return {
    'mhinz/vim-startify',
    init = function()
        vim.g.ascii = {
            '            _                                 _    ',
            '           | |                               | |   ',
            '  ___ _   _| |__   ___ _ __ _ __  _   _ _ __ | | __',
            ' / __| | | | \'_ \\ / _ \\ \'__| \'_ \\| | | | \'_ \\| |/ /',
            '| (__| |_| | |_) |  __/ |  | |_) | |_| | | | |   < ',
            ' \\___|\\__, |_.__/ \\___|_|  | .__/ \\__,_|_| |_|_|\\_\\',
            '       __/ |               | |                     ',
            '      |___/                |_|                     ',
            '',
        }
        vim.g.startify_custom_header = 'map(g:ascii + startify#fortune#boxed(), "\\" \\".v:val")'
        vim.g.startify_lists = {
            { type = 'sessions', header = { '   Sessions' } },
            { type = 'bookmarks', header = { '   Bookmarks' } },
            { type = 'files', header = { '   MRU' } },
            { type = 'dir', header = { '   Current Directory' } },
            { type = 'commands', header = { '   Commands' } },
        }

        local wich_key = require('which-key')

        wich_key.add({
            { '<leader>S', desc = 'Session', icon = '' },
            { '<leader>SS', ':SSave<cr>', desc = 'Save session', icon = '' },
            { '<leader>SL', ':SLoad<cr>', desc = 'Load session', icon = '' },
            { '<leader>SD', ':SDelete<cr>', desc = 'Delete session', icon = '󰆴' },
            { '<leader>SC', ':SClose<cr>', desc = 'Close session', icon = '󰅖' },
        })
    end,
}
