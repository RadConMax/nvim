return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup({
            ensure_installed = {
                'bash',
                'css',
                'helm',
                'html',
                'javascript',
                'json',
                'lua',
                'markdown',
                'markdown_inline',
                'sql',
                'typescript',
                'tsx',
                'vim',
                'vimdoc',
                'yaml',
            },
        })
    end,
}
