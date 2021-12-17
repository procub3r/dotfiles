require 'paqs'
require 'keymaps'
require 'nvimlsp'
require 'nvimtree'
require 'nvimcompe'
require 'treesitter'
require('nvim-autopairs').setup()

-- convenient vars --
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- colors --
cmd 'syntax on'
cmd 'set termguicolors'

g.sonokai_better_performance = 1
g.sonokai_transparent_background = 1
g.sonokai_style = 'andromeda'
cmd 'colorscheme sonokai'
-- neovim-fuzzy --
-- Get rid of 'hg' not an executable error
g.fuzzy_rootcmds = {
	"git", "rev-parse", "--show-toplevel"
}

-- vim options --
opt.number = true
opt.mouse = 'a'
opt.guicursor = 'i:block'
opt.title = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.cursorline = false
opt.clipboard = 'unnamedplus'
opt.splitbelow = true
opt.splitright = true
opt.laststatus = 0 -- No statusline
-- opt.fcs = 'eob: '  -- Get rid of `~`
-- opt.autochdir = true
