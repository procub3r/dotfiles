require 'paq' {
    'savq/paq-nvim';
    'sainnhe/sonokai';
    'rebelot/kanagawa.nvim';
    'windwp/nvim-autopairs';
    'neovim/nvim-lspconfig';
    'cloudhead/neovim-fuzzy';
    'nvim-treesitter/nvim-treesitter';

    'hrsh7th/nvim-cmp';
    'hrsh7th/vim-vsnip';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/cmp-nvim-lsp';
}

require 'lsp' -- lua/lsp.lua

require('nvim-autopairs').setup()

-- neovim-fuzzy
vim.g.fuzzy_rootcmds = {'git', 'rev-parse', '--show-toplevel'}

require('nvim-treesitter.configs').setup {
    highlight = {enable = true}
}

vim.g.mapleader = ' '
vim.keymap.set('n', [[<leader>w]], [[:w<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>q]], [[:q<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>h]], [[<c-w>h]], {noremap=true})
vim.keymap.set('n', [[<leader>j]], [[<c-w>j]], {noremap=true})
vim.keymap.set('n', [[<leader>k]], [[<c-w>k]], {noremap=true})
vim.keymap.set('n', [[<leader>l]], [[<c-w>l]], {noremap=true})
vim.keymap.set('n', [[<leader>;]], [[:nohl<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>s]], [[:!]], {noremap=true})
vim.keymap.set('t', [[<esc>]], [[<c-\><c-n>]], {noremap=true}) -- exit terminal with esc key
vim.keymap.set('n', [[<leader>f]], [[:FuzzyOpen<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>g]], [[:FuzzyGrep<cr>]], {noremap=true})

vim.cmd [[colorscheme kanagawa]]

-- vim.opt.termguicolors = true
-- vim.g.sonokai_style = 'andromeda'
-- vim.g.sonokai_better_performance = true
-- vim.g.sonokai_transparent_background = false
-- vim.g.sonokai_transparent_background = 1
-- vim.g.sonokai_diagnostic_text_highlight = 1
-- vim.g.sonokai_disable_terminal_colors = true
-- vim.g.sonokai_show_eob = false
-- vim.cmd [[colorscheme sonokai]]

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
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
