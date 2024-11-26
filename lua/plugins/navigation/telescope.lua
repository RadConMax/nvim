return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-treesitter/nvim-treesitter' },
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
                layout_config = {
                    width = 0.90,
                },
                layout_strategy = 'vertical',
                mappings = {
                    i = {
                        ['<C-h>'] = 'which_key',
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
            { '<leader>fb', builtin.buffers, desc = 'Buffers' },
            { '<leader>fc', builtin.grep_string, desc = 'Current word in working directory' },
            { '<leader>fd', ':Telescope diagnostics bufnr=0<cr>', desc = 'Diagnostics' },
            { '<leader>ff', builtin.find_files, desc = 'Files' },
            { '<leader>fg', builtin.git_files, desc = 'Git files' },
            { '<leader>fh', builtin.search_history, desc = 'History' },
            { '<leader>fj', builtin.jumplist, desc = 'Jump list' },
            { '<leader>fl', builtin.highlights, desc = 'Highlights' },
            { '<leader>fm', builtin.marks, desc = 'Marks' },
            { '<leader>fq', builtin.quickfix, desc = 'Quickfix' },
            { '<leader>fr', builtin.oldfiles, desc = 'Recent opened files' },
            { '<leader>fs', builtin.live_grep, desc = 'In working directory' },
            { '<leader>fw', builtin.spell_suggest, desc = 'Spell suggestion' },
            { '<leader>fx', builtin.current_buffer_fuzzy_find, desc = 'In current buffer' },
        })
    end,
}
