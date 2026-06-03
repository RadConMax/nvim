return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    install_dir = vim.fn.stdpath('data') .. '/site',
}
