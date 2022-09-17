require 'paqs'
require 'lsp'
require 'keymaps'
require 'autopairs'
require 'treesitter'

-- neovim-fuzzy
vim.g.fuzzy_rootcmds = {'git', 'rev-parse', '--show-toplevel'}

-- aesthetics
vim.opt.termguicolors = true
vim.g.sonokai_better_performance = true
vim.g.sonokai_transparent_background = false
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_show_eob = true
vim.g.sonokai_disable_terminal_colors = true
vim.cmd [[colorscheme sonokai]]

-- vim options
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.guicursor = 'i:block'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
