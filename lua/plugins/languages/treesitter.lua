return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }, -- Syntax aware text-objects, select, move, swap, and peek support.
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitterConfigs = require('nvim-treesitter.configs')

        treesitterConfigs.setup({
            ensure_installed = {
                'css',
                'html',
                'lua',
                'javascript',
                'json',
                'typescript',
                'tsx',
                'markdown',
                'sql',
                'toml',
                'vim',
                'vimdoc',
                'xml',
                'yaml',
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                disable = function(_, bufnr)
                    return vim.b[bufnr].large_buf
                end
            },
            incremental_selection = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['ak'] = { query = '@block.outer', desc = 'Around block' },
                        ['ik'] = { query = '@block.inner', desc = 'Inside block' },
                        ['ac'] = { query = '@class.outer', desc = 'Around class' },
                        ['ic'] = { query = '@class.inner', desc = 'Inside class' },
                        ['a?'] = { query = '@conditional.outer', desc = 'Around conditional' },
                        ['i?'] = { query = '@conditional.inner', desc = 'Inside conditional' },
                        ['af'] = { query = '@function.outer', desc = 'Around function ' },
                        ['if'] = { query = '@function.inner', desc = 'Inside function ' },
                        ['al'] = { query = '@loop.outer', desc = 'Around loop' },
                        ['il'] = { query = '@loop.inner', desc = 'Inside loop' },
                        ['aa'] = { query = '@parameter.outer', desc = 'Around argument' },
                        ['ia'] = { query = '@parameter.inner', desc = 'Inside argument' },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']k'] = { query = '@block.outer', desc = 'Next block start' },
                        [']f'] = { query = '@function.outer', desc = 'Next function start' },
                        [']a'] = { query = '@parameter.inner', desc = 'Next argument start' },
                    },
                    goto_next_end = {
                        [']K'] = { query = '@block.outer', desc = 'Next block end' },
                        [']F'] = { query = '@function.outer', desc = 'Next function end' },
                        [']A'] = { query = '@parameter.inner', desc = 'Next argument end' },
                    },
                    goto_previous_start = {
                        ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
                        ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
                        ['[a'] = { query = '@parameter.inner', desc = 'Previous argument start' },
                    },
                    goto_previous_end = {
                        ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
                        ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
                        ['[A'] = { query = '@parameter.inner', desc = 'Previous argument end' },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['>K'] = { query = '@block.outer', desc = 'Swap next block' },
                        ['>F'] = { query = '@function.outer', desc = 'Swap next function' },
                        ['>A'] = { query = '@parameter.inner', desc = 'Swap next argument' },
                    },
                    swap_previous = {
                        ['<K'] = { query = '@block.outer', desc = 'Swap previous block' },
                        ['<F'] = { query = '@function.outer', desc = 'Swap previous function' },
                        ['<A'] = { query = '@parameter.inner', desc = 'Swap previous argument' },
                    },
                },
            },
        })
    end,
}
