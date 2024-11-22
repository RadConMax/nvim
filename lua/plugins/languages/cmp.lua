return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 100,
    dependencies = {
        { 'hrsh7th/cmp-buffer' }, -- nvim-cmp source for buffer words
        { 'hrsh7th/cmp-path' }, -- nvim-cmp source for filesystem paths
        { 'hrsh7th/cmp-nvim-lua' }, -- nvim-cmp source for neovim Lua API
        { 'chrisgrieser/cmp-nerdfont' }, -- nvim-cmp source for nerdfont icons (triggered by :)
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
            dependencies = {
                { 'saadparwaiz1/cmp_luasnip' }, -- luasnip completion source for nvim-cmp
                { 'rafamadriz/friendly-snippets' }, -- Snippets collection for a set of different programming languages
            },
        }, -- Snippet engine
        { 'onsails/lspkind.nvim' }, -- Adds vscode-like pictograms to neovim built-in lsp
        {
            'folke/lazydev.nvim',
            dependencies = {
                { 'Bilal2453/luvit-meta', lazy = true },
            },
            ft = 'lua',
            opts = {
                library = {
                    { path = 'luvit-meta/library', words = { 'vim%.uv' } },
                    { path = 'lazy.nvim', words = { 'LazyVim' } },
                    { path = 'LazyNvim', words = { 'LazyVim' } },
                },
            },
        },
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local luasnip_loaders_from_vscode = require('luasnip.loaders.from_vscode')
        local lspkind = require('lspkind')
        local which_key = require('which-key')

        luasnip.config.set_config({
            history = false,
            updateevents = 'TextChanged,TextChangedI',
        })
        luasnip.filetype_extend('typescript', { 'tsdoc' })
        luasnip.filetype_extend('javascript', { 'jsdoc' })
        luasnip_loaders_from_vscode.lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = 'rounded',
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None'
                }),
                documentation = cmp.config.window.bordered({
                    border = 'rounded',
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None'
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-c>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping(
                    cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    { 'i', 'c', }
                ),
                ['<C-n>'] = cmp.mapping(function()
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's', }),
                ['<C-p>'] = cmp.mapping(function()
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's', }),
            }),
            sources = cmp.config.sources({
                { name = 'lazydev', priority = 100, group_index = 0 },
                { name = 'luasnip', priority = 40 },
                { name = 'nvim_lsp', priority = 35 },
                { name = 'nvim_lua', priority = 30 },
                { name = 'buffer', priority = 20 },
                { name = 'path', priority = 10 },
                { name = 'nerdfont', priority = 5 },
            }),
            completion = {
                completeopt = 'menu,menuone,preview,noselect', -- popup
            },
            formatting = {
                fields = {'abbr', 'kind', 'menu'},
                format = lspkind.cmp_format({ --[[mode = 'symbol', maxwidth = 50, ellipsis_char = '...'--]] })
            },
        })

        which_key.add({
            { '<leader>lv', ':LazyDev lsp<cr>', desc = 'LazyDev', icon = '' },
        })
    end
}
