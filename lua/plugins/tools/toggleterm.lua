return {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    config = function()
        local toggleterm = require('toggleterm')
        local Terminal   = require('toggleterm.terminal').Terminal
        local which_key  = require('which-key')

        -- Custom LazyGit Terminal
        local lazygit    = Terminal:new({ cmd = 'lazygit', direction = 'float', hidden = true })
        function _lazygit_toggle()
            lazygit:toggle()
        end

        -- Custom OpenCode Terminal (ID 99 to exclude from toggle-all)
        local opencode   = Terminal:new({ cmd = 'opencode', direction = 'float', hidden = true, id = 99 })
        function _opencode_toggle()
            opencode:toggle()
        end
        -- Custom Rainfrog Terminal
        local rainfrog    = Terminal:new({ cmd = 'rainfrog', direction = 'float', hidden = true })
        function _rainfrog_toggle()
            rainfrog:toggle()
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
            { '<C-Space>', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal', icon = '' },
            { '<leader>1', '<cmd>1ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal 1', icon = ' 1' },
            { '<leader>2', '<cmd>2ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal 2', icon = ' 2' },
            { '<leader>3', '<cmd>3ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal 3', icon = ' 3' },
            { '<leader>4', '<cmd>4ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal 4', icon = ' 4' },
            { '<leader>5', '<cmd>5ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal 5', icon = ' 5' },
            { '<leader>tg', '<cmd>lua _lazygit_toggle()<cr>', desc = 'Toggle Terminal LazyGit', icon = ' LazyGit' },
            { '<leader>to', '<cmd>lua _opencode_toggle()<cr>', desc = 'Toggle Terminal OpenCode', icon = '󰚩 OpenCode' },
            { '<leader>tr', '<cmd>lua _rainfrog_toggle()<cr>', desc = 'Toggle Terminal Rainfrog', icon = ' Rainfrog' },
        })

        -- Terminal mode keybinds to exit terminal mode
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
        vim.keymap.set('t', '<M-Esc>', '<C-\\><C-n>', { noremap = true })

        -- Close terminal directly from terminal mode without needing to type :q
        -- Alt+Q or Ctrl+Q to close the current terminal
        vim.keymap.set('t', '<M-q>', '<C-\\><C-n><cmd>q<cr>', { noremap = true, desc = 'Close terminal' })
        vim.keymap.set('t', '<C-q>', '<C-\\><C-n><cmd>q<cr>', { noremap = true, desc = 'Close terminal' })

        -- Toggle all terminals (except OpenCode) directly from terminal mode
        function _toggle_all_except_opencode()
            for _, term in ipairs(require('toggleterm.terminal').get_all()) do
                if term.id ~= 99 then  -- Skip OpenCode terminal
                    term:toggle()
                end
            end
        end
        vim.keymap.set('t', '<S-Space>', '<C-\\><C-n><cmd>lua _toggle_all_except_opencode()<cr>', { noremap = true, desc = 'Toggle All Terminals' })
    end,
}
