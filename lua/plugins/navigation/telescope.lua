return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-tree/nvim-web-devicons' },
    },
    lazy = false,
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local which_key = require('which-key')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-q>'] = actions.smart_send_to_qflist,
                    },
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('lazygit')

        which_key.add({
            { '<leader>f', desc = 'Find' },
            { '<leader>fb', builtin.buffers, desc = 'Find buffers' },
            { '<leader>fc', builtin.grep_string, desc = 'Find string under cursor in cwd' },
            { '<leader>fd', ':Telescope diagnostics bufnr=0<cr>', desc = 'Find buffer diagnostics' },
            { '<leader>ff', builtin.find_files, desc = 'Find files' },
            { '<leader>fg', builtin.git_files, desc = 'Find git files' },
            { '<leader>fh', builtin.search_history, desc = 'Search history' },
            { '<leader>fl', builtin.highlights, desc = 'Find highlights' },
            { '<leader>fm', builtin.marks, desc = 'Find marks' },
            { '<leader>fq', builtin.quickfix, desc = 'Find quickfix' },
            { '<leader>fQ', builtin.quickfixhistory, desc = 'Find quickfix history' },
            { '<leader>fr', builtin.oldfiles, desc = 'Find recent opened files' },
            { '<leader>fs', builtin.live_grep, desc = 'Find string in cwd' },
            { '<leader>fw', builtin.spell_suggest, desc = 'Find word suggestion' },
            { '<leader>fx', builtin.current_buffer_fuzzy_find, desc = 'Find current buffer fuzzy find' },
        })
    end,
}
