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
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
