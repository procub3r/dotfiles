local map = vim.api.nvim_set_keymap
local g = vim.g
g.mapleader = ' '

map('n', [[<leader>;]], [[:nohlsearch<cr>]], {noremap = true})
map('n', [[<leader>']], [[:set invrelativenumber<cr>]], {noremap = true})
map('n', [[<leader>\]], [[:execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>]], { noremap = true })
map('n', [[<leader>h]], [[<C-w>h]], {noremap = true})
map('n', [[<leader>j]], [[<C-w>j]], {noremap = true})
map('n', [[<leader>k]], [[<C-w>k]], {noremap = true})
map('n', [[<leader>l]], [[<C-w>l]], {noremap = true})
map('n', [[Q]], [[@q]], {noremap = true})
map('n', [[<leader>i]], [[:w<cr>]], {noremap = true})
map('n', [[<leader>q]], [[:q<cr>]], {noremap = true})
map('n', [[<leader>s]], [[:!]], {noremap = true})

-- build --
map('n', [[<leader>b]], [[:!make build<cr>]], {noremap = true})
map('n', [[<leader>o]], [[:!make run<cr>]], {noremap = true})

-- compe --
map('i', [[<C-Space>]], [[compe#complete()]], {noremap = true, silent = true, expr = true})
map('i', [[<cr>]], [[compe#confirm('<CR>')]], {noremap = true, silent = true, expr = true})
map('i', [[<C-e>]], [[compe#close('<C-e>')]], {noremap = true, silent = true, expr = true})
map('i', [[<C-f>]], [[compe#scroll({ 'delta': +4 })]], {noremap = true, silent = true, expr = true})
map('i', [[<C-d>]], [[compe#scroll({ 'delta': -4 })]], {noremap = true, silent = true, expr = true})

-- nvimtree --
map('n', [[<leader>n]], [[:NvimTreeToggle<cr>]], {noremap = true})
map('n', [[<leader>f]], [[:NvimTreeRefresh<cr>]], {noremap = true})
