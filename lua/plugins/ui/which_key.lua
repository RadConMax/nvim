return {
    'folke/which-key.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    lazy = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local which_key = require('which-key')

        which_key.setup({
            icons = {
                group = vim.g.icons_enabled and '' or '+', separator = ""
            },
            disable = {
                filetypes = {
                    'TelescopePrompt'
                },
            },
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
            },
        })
        which_key.add({
            hidden = true,
            { '<leader>kk', ':WhichKey<cr>', desc = 'Which Key (Open)' },
            {
                -- Text edit
                { 'J', 'mzJ`z', desc = 'Append next line to current line', icon = '' },
                { 'N', 'Nzzzv', desc = 'Search next but keep cursor centered', icon = '' },
                -- Navigation
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
                { '<leader>T', ':terminal<cr>', desc = 'Terminal (Open)', icon = '' },
            },
            {
                mode = { 'v' },
                -- Text edit
                { 'J', ':m \'>+1<CR>gv=gv', desc = 'Move selected line up', icon = '' },
                { 'K', ':m \'<-2<CR>gv=gv', desc = 'Move selected line down', icon = '' },
                { '<leader>y', '"+y', desc = 'Copy to system clipboard', icon = '' },
                { '<leader>Y', '"+y$', desc = 'Copy till the end of the line to system clipboard', icon = '' },
                { '<leader>p', '"+p', desc = 'Paste from system clipboard', icon = '' },
            }
        })
        which_key.add({
            -- Set filetype
            { '<leader>F', desc = 'Filetype', icon = '' },
            { '<leader>Fc', ':set filetype=config<cr>', desc = 'Config', icon = '' },
            { '<leader>Fj', ':set filetype=json<cr>', desc = 'JSON', icon = '' },
            { '<leader>Fl', ':set filetype=lua<cr>', desc = 'Lua', icon = '' },
            { '<leader>Fm', ':set filetype=markdown<cr>', desc = 'Markdown', icon = '' },
            { '<leader>Fp', ':set filetype=python<cr>', desc = 'Python', icon = '' },
            { '<leader>Fq', ':set filetype=sql<cr>', desc = 'SQL', icon = '' },
            { '<leader>Fs', ':set filetype=sh<cr>', desc = 'Shell', icon = '' },
            { '<leader>Ft', ':set filetype=typescript<cr>', desc = 'TypeScript', icon = '' },
            { '<leader>Fy', ':set filetype=yaml<cr>', desc = 'YAML', icon = '󰒋' },
            { '<leader>Fv', ':set filetype=javascript<cr>', desc = 'JavaScript', icon = '' },
        })
    end,
}
