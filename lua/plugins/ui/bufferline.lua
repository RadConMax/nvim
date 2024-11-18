return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        local bufferline = require('bufferline')
        local which_key = require('which-key')

        bufferline.setup({
            options = {
                close_command = 'Bdelete %d',
                right_mouse_command = 'Bdelete %d',
                indicator = {
                    style = '| ',
                },
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(_, _, diagnostics_dict)
                    local s = " "

                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "")

                        s = s .. n .. sym
                    end

                    return s
                end,
                separator_style = {
                    '|',
                    '|',
                },
            },
        })

        which_key.add({
            { '<leader>b', desc = 'Buffers' },
            { '<leader>ba', ':bufdo :Bdelete<cr>', desc = 'Close all buffers' },
            { '<leader>bc', ':Bdelete<cr>', desc = 'Close current buffer' },
            { '<leader>bC', ':Bdelete!<cr>', desc = 'Force close current buffer' },
            { '<leader>be', ':enew<cr>', desc = 'Edit new buffer' },
            { '<leader>bl', ':BufferLineCloseLeft<cr>', desc = 'Close all buffers to the left' },
            { '<leader>bn', ':bn<cr>', desc = 'Next buffer' },
            { '<leader>bo', ':BufferLineCloseOthers<cr>', desc = 'Close all other buffers' },
            { '<leader>bp', ':bp<cr>', desc = 'Previous buffer' },
            { '<leader>br', ':BufferLineCloseRight<cr>', desc = 'Close all buffers to the right' },
            {
                { '<leader>bs', desc = 'Sort buffers' },
                { '<leader>bsd', ':BufferLineSortByDirectory<cr>', desc = 'Sort buffers by directory' },
                { '<leader>bse', ':BufferLineSortByExtension<cr>', desc = 'Sort buffers by extension' },
            },
            { '<Tab>', ':BufferLineCycleNext<cr>', desc = 'Next buffer' },
            { '<S-Tab>', ':BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
            { '[b', ':BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
            { '[B', ':BufferLineMovePrev<cr>', desc = 'Move buffer to the left' },
            { ']b', ':BufferLineCycleNext<cr>', desc = 'Next buffer' },
            { ']B', ':BufferLineMoveNext<cr>', desc = 'Move buffer to the right' },
        })
    end,
}
