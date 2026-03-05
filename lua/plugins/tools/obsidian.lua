return {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    lazy = false,
    config = function()
        local obsidian = require('obsidian')
        local which_key = require('which-key')

        obsidian.setup({
            legacy_commands = false,
            workspaces = {
                {
                    name = 'personal',
                    path = '~/.notes/personal',
                },
                {
                    name = 'work',
                    path = '~/.notes/work',
                },
            },
            daily_notes = {
                folder = 'dailies',
                workdays_only = false,
            },
            picker = {
                name = 'telescope.nvim',
                note_mappings = {
                    new = '<C-x>',
                    insert_link = '<C-l>',
                },
                tag_mappings = {
                    tag_note = '<C-x>',
                    insert_tag = '<C-l>',
                },
            },
        })

        -- Top commands
        which_key.add({
            { '<leader>o', desc = 'Obsidian', icon = '' },
            {
                { '<leader>od',  desc = 'Dailies' },
                { '<leader>odd', ':Obsidian dailies<cr>',       desc = 'All daily notes' },
                { '<leader>odt', ':Obsidian today<cr>',         desc = 'Today\'s note' },
                { '<leader>odm', ':Obsidian dailies -30 0<cr>', desc = 'Last month notes' },
                { '<leader>odn', ':Obsidian tomorrow<cr>',      desc = 'Tomorrow\'s note' },
                { '<leader>odw', ':Obsidian dailies -7 0<cr>',  desc = 'Last week\' notes' },
                { '<leader>ody', ':Obsidian yesterday<cr>',     desc = 'Yesterday\'s note' },
            },
            { '<leader>oh', ':Obsidian help<cr>', desc = 'Help', icon = '' },
            { '<leader>og', ':Obsidian helpgrep<cr>', desc = 'Help grip', icon = '' },
            { '<leader>oO', ':Obsidian open ', desc = 'Open in Obsidian app' },
            { '<leader>on', ':Obsidian new ', desc = 'New note' },
            { '<leader>oo', ':Obsidian quick_switch<cr>', desc = 'Quick Switch' },
            { '<leader>os', ':Obsidian search ', desc = 'Search' },
            { '<leader>ot', ':Obsidian tags ', desc = 'Tags' },
            { '<leader>op', ':Obsidian workspace personal<cr>', desc = 'Personal Vault', icon = '󱉼' },
            { '<leader>ow', ':Obsidian workspace work<cr>', desc = 'Work Vault', icon = '󱉼' },
            {
                { '<leader>oT',  desc = 'Templates' },
                { '<leader>oTn', ':Obsidian new_from_template ', desc = 'New note from template' },
            },
        })

        -- Note commands
        which_key.add({
            { '<leader>or',  ':Obsidian backlinks<cr>',       desc = 'Back links' },
            { '<leader>of',  ':Obsidian follow_link<cr>',     desc = 'Follow link' },
            { '<leader>oc',  ':Obsidian toc<cr>',             desc = 'Table of contents' },
            { '<leader>oTT', ':Obsidian template ',           desc = 'Template' },
            { '<leader>ol',  ':Obsidian links<cr>',           desc = 'Links' },
            { '<leader>oi',  ':Obsidian paste_img<cr>',       desc = 'Image' },
            { '<leader>or',  ':Obsidian rename ',             desc = 'Rename' },
            { '<leader>ox',  ':Obsidian toggle_checkbox<cr>', desc = 'Toggle checkbox' },
        });

        which_key.add({
            mode = 'v',
            { '<leader>o', desc = 'Obsidian', icon = '' },
            { '<leader>oe', ':Obsidian extract_note ', desc = 'Extract selected text to new note' },
            { '<leader>ol', ':Obsidian link<cr>', desc = 'Link selected text' },
            { '<leader>on', ':Obsidian link_new ', desc = 'Link selected text to new note' },
        })
    end,
}
