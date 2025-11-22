return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local which_key = require('which-key')
        local base_on_attach = vim.lsp.config.eslint.on_attach
        local on_attach = function(_, bufnr)
            which_key.add({
                buffer = bufnr,
                noremap = true,
                hidden = true,
                { '<leader><c-k>', vim.lsp.buf.signature_help, desc = 'Signature help' },
                {
                    { 'd', desc = 'Diagnostics', icon = '󰈙' },
                    { 'dd', vim.diagnostic.open, desc = 'Open diagnostic' },
                    { 'df', vim.diagnostic.open_float, desc = 'Open float diagnostic' },
                    { 'dl', ':Telescope diagnostics bufnr=0<cr>', desc = 'Find buffer diagnostics' },
                    { 'dL', vim.diagnostic.setloclist, desc = 'Open diagnostics list' },
                    { 'dp', function() vim.diagnostic.jump({ count = -1 }) end, desc = 'Go to previous diagnostic' },
                    { 'dn', function() vim.diagnostic.jump({ count = 1 }) end, desc = 'Go to next diagnostic' },
                },
                {
                    { 'g', desc = 'Go to', icon = '' },
                    { 'gr', ':Telescope lsp_references show_line=false<cr>', desc = 'Go to LSP references' },
                    { 'gD', vim.lsp.buf.declaration, desc = 'Go to declaration' },
                    { 'gd', ':Telescope lsp_definitions<cr>', desc = 'Go to LSP definitions' },
                    { 'gi', ':Telescope lsp_implementations<cr>', desc = 'Go to LSP implementations' },
                    { 'gI', ':LspInfo<cr>', desc = 'Go to LSP information' },
                    { 'gt', ':Telescope lsp_type_definitions<cr>', desc = 'Go to LSP type definitions' },
                    { 'K', vim.lsp.buf.hover, desc = 'Show documentation for what is under cursor' },
                },
            })
            which_key.add({
                buffer = bufnr,
                noremap = true,
                {
                    { '<leader>l', desc = 'LSP', icon = '' },
                    { '<leader>lc', vim.lsp.buf.code_action, desc = 'Code actions' },
                    { '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, desc = 'Format file' },
                    { '<leader>ln', ':EslintFixAll', desc = 'Eslint file' },
                    { '<leader>lr', vim.lsp.buf.rename, desc = 'Smart rename' },
                    { '<leader>lt', ':LspRestart<cr>', desc = 'Restart LSP' },
                },
                {
                    { '<leader>w', desc = 'Workspace', icon = '󰥟' },
                    { '<leader>wa', vim.lsp.buf.add_workspace_folder, desc = 'Add workspace folder' },
                    { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = 'List workspaces folders' },
                    { '<leader>wr', vim.lsp.buf.remove_workspace_folder, desc = 'Remove workspace folder' },
                },
            })
            which_key.add({
                buffer = bufnr,
                noremap = true,
                mode = 'v',
                {
                    { '<leader>l', desc = 'LSP' },
                    { '<leader>lc', vim.lsp.buf.code_action, desc = 'Code actions' },
                },
            })
        end

        local severity = vim.diagnostic.severity

        vim.diagnostic.config({
            float = { border = 'single' },
            signs = { text = { [severity.ERROR] = ' ', [severity.WARN] = ' ', [severity.HINT] = '󰠠 ', [severity.INFO] = ' ' } },
            underline = true,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.lsp.config('bashls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('cssls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('emmet_ls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('eslint', {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                if base_on_attach then
                    base_on_attach(client, bufnr)
                end

                on_attach(client, bufnr)
            end,
        })
        vim.lsp.config('helm_ls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('html', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('jsonls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    runtime = {
                        version = 'LuaJIT',
                        path = { 'lua/?.lua', 'lua/?/init.lua' },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Depending on the usage, you might want to add additional paths here.
                            -- '${3rd}/luv/library',
                            -- '${3rd}/busted/library',
                        }
                    },
                    telemetry = {
                        enable = false,
                    },
                })
            end,
            on_attach = on_attach,
            settings = {
                Lua = { },
            },
        })
        vim.lsp.config('marksman', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('sqlls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('ts_ls', { capabilities = capabilities, on_attach = on_attach })
        vim.lsp.config('yamlls', { capabilities = capabilities, on_attach = on_attach })
    end,
}
