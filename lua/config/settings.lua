-- Leader key = space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.wrap = false

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Navigation
vim.opt.mouse = 'a'
vim.opt.scrolloff = 10
vim.opt.incsearch = true

-- Folding
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.conceallevel = 2

-- General settings
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.isfname:append('@')

-- Swap file settings
vim.opt.swapfile = true                    -- Enable swap files
vim.opt.directory = vim.fn.stdpath('state') .. '/swap//'  -- Set swap file directory
vim.opt.updatecount = 200                  -- Write swap after 200 characters typed

-- nvm node (needed by Mason and Copilot)
local nvm_dir = vim.fn.expand('~/.nvm')
local nvm_alias_file = nvm_dir .. '/alias/default'
if vim.fn.isdirectory(nvm_dir) == 1 and vim.fn.filereadable(nvm_alias_file) == 1 then
    local nvm_default = vim.fn.readfile(nvm_alias_file)[1]
    if nvm_default and vim.fn.filereadable(nvm_dir .. '/alias/' .. nvm_default) == 1 then
        nvm_default = vim.fn.readfile(nvm_dir .. '/alias/' .. nvm_default)[1]
    end
    if nvm_default then
        local nvm_node_bin = nvm_dir .. '/versions/node/' .. nvm_default .. '/bin'
        if vim.fn.isdirectory(nvm_node_bin) == 1 then
            vim.env.PATH = nvm_node_bin .. ':' .. vim.env.PATH
            vim.g.copilot_node_command = nvm_node_bin .. '/node'
        end
    end
end

-- Helm files
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
    pattern = { '*.tpl', '*/templates/*.yaml', '*/templates/*.yml' },
    callback = function()
        vim.bo.filetype = 'helm'
    end,
})
