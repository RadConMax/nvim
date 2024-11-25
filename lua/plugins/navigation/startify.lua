return {
    'mhinz/vim-startify',
    init = function()
        vim.g.ascii = {
            '__________             .____________                    _____                 ',
            '\\______   \\_____     __| _/\\_   ___ \\  ____   ____     /     \\ _____  ___  ___',
            ' |       _/\\__  \\   / __ | /    \\  \\/ /  _ \\ /    \\   /  \\ /  \\\\__  \\ \\  \\/  /',
            ' |    |   \\ / __ \\_/ /_/ | \\     \\___(  <_> )   |  \\ /    Y    \\/ __ \\_>    < ',
            ' |____|_  /(____  /\\____ |  \\______  /\\____/|___|  / \\____|__  (____  /__/\\_ \\',
            '        \\/      \\/      \\/         \\/            \\/          \\/     \\/      \\/ ',
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
