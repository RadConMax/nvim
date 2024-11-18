return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'hrsh7th/cmp-buffer' }, -- nvim-cmp source for buffer words
        { 'hrsh7th/cmp-path' }, -- nvim-cmp source for filesystem paths
        { 'hrsh7th/cmp-nvim-lua' }, -- nvim-cmp source for neovim Lua API
        { 'L3MON4D3/LuaSnip' }, -- Snippet engine
        { 'saadparwaiz1/cmp_luasnip' }, -- luasnip completion source for nvim-cmp
        { 'rafamadriz/friendly-snippets' }, -- Snippets collection for a set of different programming languages
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        require('luasnip.loaders.from_vscode').lazy_load()

        local border_opts = {
            border = 'rounded',
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None'
        }

        luasnip.filetype_extend('typescript', { 'tsdoc' })
        luasnip.filetype_extend('javascript', { 'jsdoc' })

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect',
            },
            window = {
                completion = cmp.config.window.bordered(border_opts),
                documentation = cmp.config.window.bordered(border_opts),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-c>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jumpable()
                    else fallback() end
                end, { 'i', 's', }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then luasnip.jump(-1)
                    else fallback() end
                end, { 'i', 's', }),
            }),
            sources = cmp.config.sources({
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nvim_lua' },
                { name = 'nvim_lsp' },
            }),
        })
    end
}
