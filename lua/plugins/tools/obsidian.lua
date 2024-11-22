return {
    'epwalsh/obsidian.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    version = '*',
    lazy = false,
    config = function()
        local obsidian = require('obsidian')
        local which_key = require('which-key')
        local obsidian_vault_path = os.getenv('OBSIDIAN_VAULT_PATH')
        local obsidian_images_path = os.getenv('OBSIDIAN_IMAGES_PATH')

        obsidian.setup({
            attachments = {
                img_folder = obsidian_images_path,
            },
            ui = {
                enable = false,
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
            { '<leader>ob', ':ObsidianOpen ', desc = 'Open in app' },
            {
                { '<leader>od', desc = 'Dailies' },
                {
                    { '<leader>odo', desc = 'Open daily notes' },
                    { '<leader>odoa', ':ObsidianDailies<cr>', desc = 'All' },
                    { '<leader>odom', ':ObsidianDailies -30 0<cr>', desc = 'Last month' },
                    { '<leader>odos', ':ObsidianDailies -180 0<cr>', desc = 'Last six months' },
                    { '<leader>odow', ':ObsidianDailies -7 0<cr>', desc = 'Last week' },
                    { '<leader>odoy', ':ObsidianDailies -365 0<cr>', desc = 'Last year' },
                },
                {
                    { '<leader>odn', desc = 'New daily note' },
                    { '<leader>odnn', ':ObsidianTomorrow<cr>', desc = 'Tomorrow\'s note' },
                    { '<leader>odnt', ':ObsidianToday<cr>', desc = 'Today\'s note' },
                    { '<leader>odny', ':ObsidianYesterday<cr>', desc = 'Yesterday\'s note' },
                },
            },
            { '<leader>of', ':ObsidianFollowLink<cr>', desc = 'Follow link' },
            { '<leader>oi', ':ObsidianPasteImg<cr>', desc = 'Image' },
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
            { '<leader>op', ':MarkdownPreviewToggle<cr>', desc = 'Toggle preview' },
            { '<leader>or', ':ObsidianRename ', desc = 'Rename' },
            {
                { '<leader>os', desc = 'Search' },
                { '<leader>osb', ':ObsidianBacklinks <cr>', desc = 'Back links' },
                { '<leader>osc', ':ObsidianTOC<cr>', desc = 'Table of contents' },
                { '<leader>osl', ':ObsidianLinks<cr>', desc = 'Links' },
                { '<leader>ost', ':ObsidianTags ', desc = 'Tags' },
                { '<leader>osw', ':ObsidianSearch ', desc = 'Word' },
            },
            {
                { '<leader>ot', desc = 'Templates' },
                { '<leader>otf', ':ObsidianNewFromTemplate ', desc = 'From Template' },
                { '<leader>oti', ':ObsidianTemplate ', desc = 'Insert' },
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
