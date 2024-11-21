return {
    'epwalsh/obsidian.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    version = '*',
    lazy = false,
    config = function()
        local obsidian = require('obsidian')
        local which_key = require('which-key')
        local obsidian_vault_path = os.getenv('OBSIDIAN_VAULT_PATH')

        obsidian.setup({
            ui = {
                enableL = false,
            },
            workspaces = {
                {
                    name = 'current',
                    path = function()
                        return assert(vim.fn.getcwd())
                    end,
                    overrides = {
                        notes_subdir = vim.NIL,
                        new_notes_location = 'current_dir',
                        templates = {
                            subdir = vim.NIL,
                        },
                        disable_frontmatter = true,
                    },
                },
                {
                    name = 'global',
                    path = '~/.notes',
                },
                {
                    name = 'obsidian',
                    path = (obsidian_vault_path == nil and '~/.notes') or obsidian_vault_path,
                },
            },
            notes_subdir = '.notes',
            daily_notes = {
                folder = '.notes/dailies',
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
            note_id_func = function(title)
                local suffix = ''

                if title ~= nil then
                    suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
                else
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end

                return tostring(os.time()) .. '-' .. suffix
            end,
            note_frontmatter_func = function(note)
                if note.title then
                    note:add_alias(note.title)
                end

                local out = { id = note.id, aliases = note.aliases, tags = note.tags }

                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
            picker = {
                name = 'telescope.nvim',
                mappings = {
                    new = '<c-x>',
                    insert_link = '<c-l>',
                },
            },
        })

        which_key.add({
            { '<leader>m', desc = 'Markdown', icon = '' },
            {
                '<leader>mm',
                function()
                    vim.cmd('ObsidianWorkspace current')
                    vim.cmd('ObsidianQuickSwitch')
                end,
                desc = 'Current Markdown Files',
                icon = '',
            },
            {
                '<leader>mg',
                function()
                    vim.cmd('ObsidianWorkspace global')
                    vim.cmd('ObsidianQuickSwitch')
                end,
                desc = 'Global Markdown Files',
                icon = '',
            },
            { '<leader>o', desc = 'Obsidian', icon = '' },
            { '<leader>ob', ':ObsidianBackLinks<cr>', desc = 'Back links' },
            {
                { '<leader>od', desc = 'Dailies' },
                { '<leader>odd', ':ObsidianDailies<cr>', desc = 'All' },
                { '<leader>odm', ':ObsidianDailies -30 0<cr>', desc = 'Last month' },
                { '<leader>ods', ':ObsidianDailies -180 0<cr>', desc = 'Last six months' },
                { '<leader>odw', ':ObsidianDailies -7 0<cr>', desc = 'Last week' },
                { '<leader>ody', ':ObsidianDailies -365 0<cr>', desc = 'Last year' },
            },
            { '<leader>of', ':ObsidianFollowLink<cr>', desc = 'Follow link' },
            { '<leader>oi', ':ObsidianPasteImg ', desc = 'Paste image from clipboard' },
            { '<leader>ol', ':ObsidianLinks<cr>', desc = 'Show links' },
            { '<leader>on', ':ObsidianNew ', desc = 'New' },
            {
                '<leader>oo',
                function()
                    vim.cmd('ObsidianWorkspace obsidian')
                    vim.cmd('ObsidianQuickSwitch')
                end,
                desc = 'Obsidian Markdown Files',
                icon = '',
            },
            { '<leader>oO', ':ObsidianOpen ', desc = 'Open in app' },
            { '<leader>os', ':ObsidianSearch ', desc = 'Search' },
            {
                { '<leader>ot', desc = 'Take daily note' },
                { '<leader>ott', ':ObsidianToday<cr>', desc = 'Today\'s note' },
                { '<leader>otw', ':ObsidianTomorrow<cr>', desc = 'Tomorrow\'s note' },
                { '<leader>oty', ':ObsidianYesterday<cr>', desc = 'Yesterday\'s note' },
            },
            {
                { '<leader>ow', desc = 'Workspaces' },
                { '<leader>owc', ':ObsidianWorkspace current<cr>', desc = 'Current' },
                { '<leader>owg', ':ObsidianWorkspace global<cr>', desc = 'Global' },
                { '<leader>owo', ':ObsidianWorkspace obsidian<cr>', desc = 'Obsidian' },
            },
        })
        which_key.add({
            mode = 'v',
            { '<leader>o', desc = 'Obsidian', icon = '' },
            { '<leader>oe', ':ObsidianExtractNote ', desc = 'Extract selected text to new note' },
            { '<leader>ol', ':ObsidianLink<cr>', desc = 'Link selected text' },
            { '<leader>on', ':ObsidianLinkNew ', desc = 'Link selected text to new note' },
        })
    end,
}
