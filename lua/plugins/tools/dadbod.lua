return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        vim.g.db_ui_use_nvim_notify = 1
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_winwidth = 70

        local which_key = require('which-key')

        which_key.add({
            { '<leader>D', desc = 'Database', icon = '' },
            { '<leader>DD', ':DBUIToggle<cr>', desc = 'Database', icon = '' },
            { '<leader>Da', ':DBUIAddConnection<cr>', desc = 'Add connection', icon = '' },
            { '<leader>Db', ':DBUIFindBuffer<cr>', desc = 'Find buffer', icon = '' },
            { '<leader>Dl', ':DBUILastQueryInfo<cr>', desc = 'Last query info', icon = '' },
            { '<leader>Dr', ':DBUIRenameBuffer<cr>', desc = 'Rename buffer', icon = '󰑕' },
        })
    end,
}
