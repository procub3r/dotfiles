-- map keybinds first so i still get to use them if something in the config errors out
vim.g.mapleader = ' '
-- vim.keymap.set('i', [[jk]], [[<esc>]], {noremap=true})
vim.keymap.set('n', [[<leader>w]], [[:w<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>q]], [[:q<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>h]], [[<c-w>h]], {noremap=true})
vim.keymap.set('n', [[<leader>j]], [[<c-w>j]], {noremap=true})
vim.keymap.set('n', [[<leader>k]], [[<c-w>k]], {noremap=true})
vim.keymap.set('n', [[<leader>l]], [[<c-w>l]], {noremap=true})
vim.keymap.set('n', [[<leader>;]], [[:nohl<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>e]], [[:e ]], {noremap=true})
vim.keymap.set('n', [[<leader>s]], [[:!]], {noremap=true})
vim.keymap.set('n', [[<leader>f]], [[:FuzzyOpen<cr>]], {noremap=true})
vim.keymap.set('n', [[<leader>g]], [[:FuzzyGrep<cr>]], {noremap=true})
vim.keymap.set('t', [[<esc>]], [[<c-\><c-n>]], {noremap=true}) -- exit terminal with esc key

require('paq') {
    'savq/paq-nvim';
    'rebelot/kanagawa.nvim';
    'sainnhe/gruvbox-material';
    'windwp/nvim-autopairs';
    'cloudhead/neovim-fuzzy';
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'neovim/nvim-lspconfig';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/vim-vsnip';
}

-- require('kanagawa').setup({
--     transparent = true,
--     colors = {theme={all={ui={bg_gutter="none"}}}}
-- })
-- vim.cmd [[colorscheme kanagawa]]

vim.cmd [[set termguicolors]]
vim.g.gruvbox_material_better_performance = true
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_dim_inactive_windows = 0
vim.g.gruvbox_material_menu_selection_background = 'green'
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_transparent_background = 2
vim.cmd [[colorscheme gruvbox-material]]

require('nvim-autopairs').setup()
require('blame').setup({})
require('nvim-treesitter.configs').setup {
    highlight = {enable = true}
}

vim.cmd [[highlight ExtraWhitespace ctermbg=grey guibg=grey]] -- highlight trailing whitespace
vim.cmd [[hi StatusLine ctermbg=Cyan ctermfg=Red]]
vim.cmd [[match ExtraWhitespace /\s\+$/]]
-- vim.cmd [[set cmdheight=0]]

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.guicursor = 'i:block'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
-- vim.opt.colorcolumn = '81'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.laststatus = 2

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- enable lsp at the end so i still get to use nvim with my preferences if lsp errors out on me
require('lsp')
