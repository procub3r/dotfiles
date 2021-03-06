require 'paqs'
require 'keymaps'
require('nvim-autopairs').setup()
require 'tree_nvim'
require 'treesitter'
require 'compe_nvim'
require 'lspconfig_nvim'

-- convenient vars --
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- colors --
cmd 'syntax on'
cmd 'set termguicolors'

g.sonokai_better_performance = 1
g.sonokai_transparent_background = 1
g.sonokai_style = 'atlantis'
cmd 'colorscheme sonokai'

-- vim options --
opt.number = true
opt.mouse = 'a'
opt.title = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.cursorline = true
opt.fcs = 'eob: '  -- Get rid of `~`
opt.clipboard = 'unnamedplus'
