return {
    'mfussenegger/nvim-dap',
    dependencies = {
        { 'rcarriga/nvim-dap-ui' },
        { 'nvim-neotest/nvim-nio' },
        { 'theHamsta/nvim-dap-virtual-text' },
        { 'microsoft/vscode-js-debug', build = 'npm install --legacy-peer-deps && gulp vsDebugServerBundle && mv dist out' },
        { 'mxsdev/nvim-dap-vscode-js' },
        { 'Joakker/lua-json5' },
    },
    lazy = false,
    config = function()
        local dap = require('dap')
        local dap_ext_vscode = require('dap.ext.vscode')
        local dap_utils = require('dap.utils')
        local dapui = require('dapui')
        local dap_virtual_text = require('nvim-dap-virtual-text')
        local dap_vscode_js = require('dap-vscode-js')
        local which_key = require('which-key')

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointReject', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', { text = '󰰎', texthl = 'DatLogPoint', linehl = 'DatLogPoint', numhl = 'DatLogPoint' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

        dapui.setup({})

        dap_virtual_text.setup({
            enabled = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = true,
            commented = false,
            only_first_definition = false,
            all_references = true,
            clear_on_continue = true,
            virt_text_pos = 'eol',
        })

        which_key.add({
            { '<leader>d', desc = 'DAP', icon = '' },
            { '<leader>da', function() dap.clear_breakpoints() end, desc = 'Clear All Breakpoints', icon = '' },
            { '<leader>db', function() dap.toggle_breakpoint() end, desc = 'Toggle Breakpoint', icon = '' },
            { '<leader>dc', function() dap.continue() end, desc = 'Continue', icon = '' },
            { '<leader>dd', function() dapui.toggle() end, desc = 'DAP UI', icon = '' },
            { '<leader>dh', function() dap.set_breakpoint(nil, vim.fn.input('Hits: '), nil) end, desc = 'Hits Breakpoint', icon = '󰰂' },
            { '<leader>di', function() dap.step_into() end, desc = 'Step into', icon = '' },
            { '<leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Message: ')) end, desc = 'Log Breakpoint', icon = '󰰎' },
            { '<leader>dn', function() dap.step_over() end, desc = 'Step over', icon = '' },
            { '<leader>do', function() dap.step_out() end, desc = 'Step out', icon = '' },
            { '<leader>dp', function() dap.step_back() end, desc = 'Step back', icon = '' },
            { '<leader>dr', function() dapui.open({ reset = true }) end, desc = 'Reset UI', icon = '' },
            { '<leader>dR', function() dap.restart() end, desc = 'Restart', icon = '' },
            { '<leader>ds', function() dap.continue() end, desc = 'Start', icon = '' },
            { '<leader>dx', function() dap.close() end, desc = 'Stop', icon = '' },
            { '<leader>dv', function() dap_ext_vscode.load_launchjs() end, desc = 'Load configs', icon = '' },
            { '<leader>d?', function() dap.set_breakpoint(vim.fn.input('Condition: '), nil, nil) end, desc = 'Conditional Breakpoint', icon = '' },
        })

        -- Node configuration
        for _, language in ipairs({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }) do
            dap.configurations[language] = {
                {
                    type = 'pwa-node',
                    request = 'launch',
                    name = 'Launch file',
                    program = '${file}',
                    cwd = '${workspaceFolder}',
                    sourceMaps = true,
                },
                {
                    type = 'pwa-node',
                    request = 'attach',
                    name = 'Attach',
                    processId = dap_utils.pick_process,
                    cwd = '${workspaceFolder}',
                    sourceMaps = true,
                },
                {
                    type = 'pwa-chrome',
                    request = 'launch',
                    name = 'Launch & Debug Chrome',
                    url = function()
                        local co = coroutine.running()

                        return coroutine.create(function()
                            vim.ui.input({ prompt = 'Enter URL:', default = 'http://localhost:3000' }, function(url)
                                if (url == nil or url == '') then return
                                else coroutine.resume(co, url) end
                            end)
                        end)
                    end,
                    wbeRoot = '${workspaceFolder}',
                    skipFiles = { '<node_internals>/**/*.js' },
                    protocol = 'inspector',
                    sourceMaps = true,
                    userDataDir = true,
                },
                { name = '----- launch.json configs -----', type = '', request = 'launch' },
            }
        end
        dap_vscode_js.setup({
            node_path = "node",
            debugger_path = vim.fn.resolve(vim.fn.stdpath('data') .. '/lazy/vscode-js-debug'),
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
        })
    end,
}
