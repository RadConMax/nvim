return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
        { 'nvim-tree/nvim-web-devicons' },
        {
            'iamcco/markdown-preview.nvim',
            cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
            build = function()
                vim.fn['mkdp#util#install']()
            end,
        },
    },
    lazy = true,
    config = function()
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_combine_preview = 1
        vim.g.mkdp_refresh_slow = 1
        vim.g.mkdp_images_path = os.getenv('MARKDOWN_IMAGES_PATH')

        local render_markdown = require('render-markdown')
        local which_key = require('which-key')

        render_markdown.setup()

        which_key.add({
            { '<leader>m', desc = 'Markdown', icon = '' },
            { '<leader>mc', ':RenderMarkdown config<cr>', desc = 'Config' },
            { '<leader>md', ':RenderMarkdown contract<cr>', desc = 'Decrease anti-conceal' },
            { '<leader>mD', ':RenderMarkdown debug<cr>', desc = 'debug' },
            { '<leader>mi', ':RenderMarkdown expand<cr>', desc = 'Increase anti-conceal' },
            { '<leader>ml', ':RenderMarkdown logs<cr>', desc = 'Logs' },
            { '<leader>mp', ':MarkdownPreviewToggle<cr>', desc = 'Toggle preview' },
            { '<leader>mt', ':RenderMarkdown toggle<cr>', desc = 'Toggle Markdown Render' },
        })
    end,
}
