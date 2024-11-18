return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    init = function()
        local which_key = require('which-key')

        require('gitsigns').setup({
            current_line_blame_opts = {
                virt_text_pos = 'right_align',
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                -- Navigations
                which_key.add({
                    buffer = bufnr,
                    expr = true,
                    {
                        ']h',
                        function()
                            if vim.wo.diff then return ']c' end
                            vim.schedule(function() gs.next_hunk() end)
                            return '<Ignore>'
                        end,
                        desc = 'Next hunk',
                    },
                    {
                        '[h',
                        function()
                            if vim.wo.diff then return '[c' end
                            vim.schedule(function() gs.prev_hunk() end)
                            return '<Ignore>'
                        end,
                        desc = 'Previous hunk',
                    },
                })

                -- Actions
                which_key.add({
                    buffer = bufnr,
                    { '<leader>g', desc = 'Git' },
                    { '<leader>gs', gs.stage_hunk, desc = 'Stage hunk' },
                    { '<leader>gr', gs.reset_hunk, desc = 'Reset hunk' },
                    { '<leader>gS', gs.stage_buffer, desc = 'Stage buffer' },
                    { '<leader>gu', gs.undo_stage_hunk, desc = 'Undo stage hunk' },
                    { '<leader>gR', gs.reset_buffer, desc = 'Reset buffer' },
                    { '<leader>gp', gs.preview_hunk, desc = 'Preview hunk' },
                    { '<leader>gb', function() gs.blame_line { full = true } end, desc = 'Blame line' },
                    { '<leader>gd', gs.diffthis, desc = 'Diff this' },
                    { '<leader>gD', function() gs.diffthis('~') end, desc = 'Diff ~' },
                    { '<leader>gt', gs.toggle_current_line_blame, desc = 'Toggle current line blame' },
                    { '<leader>gT', gs.toggle_deleted, desc = 'Toggle deleted' },
                })
                which_key.add({
                    buffer = bufnr,
                    mode = 'v',
                    { '<leader>s', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, desc = 'Stage hunk' },
                    { '<leader>r', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, desc = 'Reset hunk' },
                })

                -- Text object
                which_key.add({
                    buffer = bufnr,
                    mode = { 'o', 'x' },
                    { 'ih', ':<C-U>Gitsigns select_hunk<CR>', desc = 'Stage hunk' },
                })
            end,
        })
    end,
}
