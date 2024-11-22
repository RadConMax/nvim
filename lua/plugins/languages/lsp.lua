return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
        vim.diagnostic.config({ float = { border = 'rounded' } })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local which_key = require('which-key')
        local on_attach = function(_, bufnr)
            which_key.add({
                buffer = bufnr,
                noremap = true,
                hidden = true,
                { '<c-k>', vim.lsp.buf.signature_help, desc = 'Signature help' },
                {
                    { 'd', desc = 'Diagnostics', icon = '󰈙' },
                    { 'dd', vim.diagnostic.open, desc = 'Open diagnostic' },
                    { 'df', vim.diagnostic.open_float, desc = 'Open float diagnostic' },
                    { 'dl', ':Telescope diagnostics bufnr=0<cr>', desc = 'Find buffer diagnostics' },
                    { 'dL', vim.diagnostic.setloclist, desc = 'Open diagnostics list' },
                    { 'dp', vim.diagnostic.goto_prev, desc = 'Go to previous diagnostic' },
                    { 'dn', vim.diagnostic.goto_next, desc = 'Go to next diagnostic' },
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

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }

        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type

            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        lspconfig['html'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['ts_ls'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['cssls'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['tailwindcss'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['emmet_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        })
        lspconfig['eslint'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        })
        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                    },
                },
            },
        })
    end,
}
