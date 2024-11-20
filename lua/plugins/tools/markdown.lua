return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
        local render_markdown = require('render-markdown')
        local which_key = require('which-key')

        render_markdown.setup()

        which_key.add({
            { '<leader>m', desc = 'Markdown', icon = '' },
            { '<leader>mc', ':rendermarkdown config<cr>', desc = 'Config' },
            { '<leader>md', ':rendermarkdown contract<cr>', desc = 'Decrease anti-conceal' },
            { '<leader>mD', ':rendermarkdown debug<cr>', desc = 'debug' },
            { '<leader>mi', ':rendermarkdown expand<cr>', desc = 'Increase anti-conceal' },
            { '<leader>ml', ':rendermarkdown logs<cr>', desc = 'Logs' },
            { '<leader>mt', ':RenderMarkdown toggle<cr>', desc = 'Toggle Markdown Render' },
        })
    end,
}
