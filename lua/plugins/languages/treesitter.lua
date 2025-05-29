return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    install_dir = vim.fn.stdpath('data') .. '/site',
    config = function()
        local treesitter = require('nvim-treesitter')

        treesitter.install({
            'css',
            'helm',
            'html',
            'javascript',
            'json',
            'lua',
            'markdown',
            'tsx',
            'sql',
            'toml',
            'typescript',
            'vim',
            'vimdoc',
            'xml',
            'yaml',
        })
    end,
}
