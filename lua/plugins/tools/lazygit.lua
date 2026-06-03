return {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    lazy = false,
    config = function()
        require('telescope').load_extension('lazygit')
        local which_key = require('which-key')

        which_key.add({
            hidden = true,
            { '<leader>gg', ':LazyGit<cr>', desc = 'LazyGit' },
            { '<leader>GG', ':LazyGitCurrentFile<cr>', desc = 'LazyGitCurrentFile' },
        })
    end,
}
