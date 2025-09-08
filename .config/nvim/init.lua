-- keybindings
-- mapleader must be set before requiring other files
-- as they might be creating keybindings using <leader>
vim.g.mapleader = ' '
-- :w :q
vim.keymap.set('n', '<leader>w', ':w<cr>', {noremap=true})
vim.keymap.set('n', '<leader>q', ':q<cr>', {noremap=true})
-- <leader>{h,j,k,l}
vim.keymap.set('n', '<leader>h', '<c-w>h', {noremap=true})
vim.keymap.set('n', '<leader>j', '<c-w>j', {noremap=true})
vim.keymap.set('n', '<leader>k', '<c-w>k', {noremap=true})
vim.keymap.set('n', '<leader>l', '<c-w>l', {noremap=true})
vim.keymap.set('n', '<leader>H', '<c-w>H', {noremap=true})
vim.keymap.set('n', '<leader>J', '<c-w>J', {noremap=true})
vim.keymap.set('n', '<leader>K', '<c-w>K', {noremap=true})
vim.keymap.set('n', '<leader>L', '<c-w>L', {noremap=true})
vim.keymap.set('n', '<leader>=', '<c-w>=', {noremap=true})
-- tabs
vim.keymap.set('n', '<leader>th', ':tabprev<cr>', {noremap=true})
vim.keymap.set('n', '<leader>tl', ':tabnext<cr>', {noremap=true})
vim.keymap.set('n', '<leader>tn', ':tabnew<cr>', {noremap=true})
vim.keymap.set('n', '<leader>tw', ':tabclose<cr>', {noremap=true})
vim.keymap.set('n', '<leader>ts', ':tab split<cr>', {noremap=true})
-- misc
vim.keymap.set('n', '<leader>;', ':nohl<cr>', {noremap=true})
vim.keymap.set('n', '<leader>e', ':e ', {noremap=true})
vim.keymap.set('n', '<leader>s', ':!', {noremap=true})
-- escape terminal
vim.keymap.set('t', '<s-esc>', [[<c-\><c-n>]], {noremap=true})

-- vim opts
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.guicursor = 'i:block'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.list = true
-- spaces > tabs. fight me
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

require('pacs')
require('lsp')
