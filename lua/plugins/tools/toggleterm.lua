return {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    config = function()
        local toggleterm = require('toggleterm')
        local Terminal   = require('toggleterm.terminal').Terminal
        local which_key  = require('which-key')

        -- Custom LazySql Terminal
        local lazysql = Terminal:new({ cmd = 'lazysql', direction = 'float', hidden = true, count = 2 })
        function _lazysql_toggle()
            lazysql:toggle()
        end

        -- Custom Rainfrog Terminal
        local rainfrog = Terminal:new({ cmd = 'rainfrog', direction = 'float', hidden = true, count = 3 })
        function _rainfrog_toggle()
            rainfrog:toggle()
        end

        -- Custom Claude Terminal
        local claude = Terminal:new({ cmd = 'claude -c', direction = 'float', hidden = true, count = 4 })
        function _claude_toggle()
            claude:toggle()
        end

        toggleterm.setup({
            -- Exit terminal mode with Escape, then you can use keybinds
            shell = vim.o.shell,
            persist_size = true,
            persist_mode = true,
            direction = 'float',
        })

        which_key.add({
            -- In terminal mode, press Escape to exit terminal mode first, then use these
            -- Or use these from normal mode directly
            { '<C-Space>', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal', icon = '' },
            { '<M-9>', '<cmd>lua _lazysql_toggle()<cr>', desc = 'Toggle Terminal LazySql', icon = ' LazySql' },
            { '<M-0>', '<cmd>lua _rainfrog_toggle()<cr>', desc = 'Toggle Terminal Rainfrog', icon = ' Rainfrog' },
            { '<M-Space>', '<cmd>lua _claude_toggle()<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal Claude', icon = '󰭆 Claude' },
        })

        -- Terminal mode keybinds to exit terminal mode
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
        vim.keymap.set('t', '<M-Esc>', '<C-\\><C-n>', { noremap = true })

        -- Close terminal directly from terminal mode without needing to type :q
        -- Alt+Q or Ctrl+Q to close the current terminal
        vim.keymap.set('t', '<M-q>', '<C-\\><C-n><cmd>q<cr>', { noremap = true, desc = 'Close terminal' })
        vim.keymap.set('t', '<C-q>', '<C-\\><C-n><cmd>q<cr>', { noremap = true, desc = 'Close terminal' })
    end,
}
