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
        vim.g.db_ui_winwidth = 50
        vim.g.db_ui_disable_mappings_sql = 1
        vim.g.db_ui_disable_mappings_javascript = 1

        local which_key = require('which-key')

        which_key.add({
            { '<leader>D', desc = 'Database', icon = '' },
            { '<leader>DD', ':DBUIToggle<cr>', desc = 'Database', icon = '' },
            { '<leader>Da', ':DBUIAddConnection<cr>', desc = 'Add connection', icon = '' },
            { '<leader>Db', ':DBUIFindBuffer<cr>', desc = 'Find buffer', icon = '' },
            { '<leader>Dl', ':DBUILastQueryInfo<cr>', desc = 'Last query info', icon = '' },
            { '<leader>Dr', ':DBUIRenameBuffer<cr>', desc = 'Rename buffer', icon = '󰑕' },
        })
        which_key.add({
            ft = { 'sql', 'mysql', 'plsql' },
            { '<leader>e', '<Plug>(DBUI_ExecuteQuery)', desc = 'Execute query', icon = '' },
            { '<leader>p', '<Plug>(DBUI_EditBindParameters)', desc = 'Edit bind parameters', icon = '' },
            { '<leader>r', '<Plug>(DBUI_ToggleResultLayout)', desc = 'Toggle results', icon = ' ' },
            { '<leader>s', '<Plug>(DBUI_SaveQuery)', desc = 'Save query', icon = '' },
        })
        which_key.add({
            mode = { 'v' },
            ft = { 'sql', 'mysql', 'plsql' },
            { '<leader>E', '<Plug>(DBUI_ExecuteQuery)', desc = 'Execute selected query', icon = '' },
        })
    end,
}
