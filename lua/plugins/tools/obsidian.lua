return {
    'epwalsh/obsidian.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    version = '*',
    lazy = false,
    config = function()
        local markdown_images_path = os.getenv('MARKDOWN_IMAGES_PATH')
        local personal_vault_path = os.getenv('PERSONAL_VAULT_PATH')
        local work_vault_path = os.getenv('WORK_VAULT_PATH')

        local obsidian = require('obsidian')
        local which_key = require('which-key')

        obsidian.setup({
            attachments = {
                img_folder = markdown_images_path,
                img_name_func = function()
                    return string.format('%s-', os.time())
                end,
                img_text_func = function(client, path)
                    path = client:vault_relative_path(path) or path
                    return string.format(
                        '![%s](%s)',
                        path.name,
                        string.gsub(path.filename, '%s+', '%%20')
                    )
                end,
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
                    name = 'personal',
                    path = (personal_vault_path == nil and '~') or personal_vault_path,
                },
                {
                    name = 'work',
                    path = (work_vault_path == nil and '~') or work_vault_path,
                },
            },
            daily_notes = {
                folder = 'dailies',
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
            {
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
            },
            { '<leader>o', desc = 'Obsidian', icon = '' },
            { '<leader>ob', ':ObsidianBacklinks <cr>', desc = 'Back links' },
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
            { '<leader>oo', ':ObsidianOpen ', desc = 'Open in app' },
            { '<leader>or', ':ObsidianRename ', desc = 'Rename' },
            {
                { '<leader>os', desc = 'Search' },
                { '<leader>osc', ':ObsidianTOC<cr>', desc = 'Table of contents' },
                { '<leader>osl', ':ObsidianLinks<cr>', desc = 'Links' },
                { '<leader>ost', ':ObsidianTags ', desc = 'Tags' },
                { '<leader>osw', ':ObsidianSearch ', desc = 'Words' },
            },
            {
                { '<leader>ot', desc = 'Templates' },
                { '<leader>otf', ':ObsidianNewFromTemplate ', desc = 'From Template' },
                { '<leader>oti', ':ObsidianTemplate ', desc = 'Insert' },
            },
            {
                {
                    '<leader>op',
                    function()
                        vim.cmd('ObsidianWorkspace personal')
                        vim.cmd('ObsidianQuickSwitch')
                    end,
                    desc = 'Personal Vault Files',
                    icon = '',
                },
                {
                    '<leader>ow',
                    function()
                        vim.cmd('ObsidianWorkspace work')
                        vim.cmd('ObsidianQuickSwitch')
                    end,
                    desc = 'Work Vault Files',
                    icon = '',
                },
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
