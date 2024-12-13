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
            { '<leader>De', '<Plug>(DBUI_ExecuteQuery)', desc = 'Execute query', icon = '' },
            { '<leader>Di', ':DBUILastQueryInfo<cr>', desc = 'Last query info', icon = '' },
            { '<leader>Dp', '<Plug>(DBUI_EditBindParameters)', desc = 'Edit bind parameters', icon = '' },
            { '<leader>Dr', ':DBUIRenameBuffer<cr>', desc = 'Rename buffer', icon = '󰑕' },
            { '<leader>Ds', '<Plug>(DBUI_SaveQuery)', desc = 'Save query', icon = '' },
            { '<leader>Dt', '<Plug>(DBUI_ToggleResultLayout)', desc = 'Toggle results', icon = ' ' },
        })
        which_key.add({
            mode = { 'v' },
            { '<leader>De', '<Plug>(DBUI_ExecuteQuery)', desc = 'Execute selected query', icon = '' },
        })
    end,
}
