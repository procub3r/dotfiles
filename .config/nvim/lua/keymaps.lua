local map = vim.api.nvim_set_keymap
local g = vim.g

map('n', [[\\]], [[:nohlsearch<cr>]], {noremap = true})
map('n', [[;;]], [[:set invrelativenumber<cr>]], {noremap = true})
map('n', [['']], [[:execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>]], { noremap = true })
map('n', [[<C-h>]], [[<C-w>h]], {noremap = true})
map('n', [[<C-j>]], [[<C-w>j]], {noremap = true})
map('n', [[<C-k>]], [[<C-w>k]], {noremap = true})
map('n', [[<C-l>]], [[<C-w>l]], {noremap = true})

-- compe --
map('i', [[<C-Space>]], [[compe#complete()]], {noremap = true, silent = true, expr = true})
map('i', [[<cr>]], [[compe#confirm('<CR>')]], {noremap = true, silent = true, expr = true})
map('i', [[<C-e>]], [[compe#close('<C-e>')]], {noremap = true, silent = true, expr = true})
map('i', [[<C-f>]], [[compe#scroll({ 'delta': +4 })]], {noremap = true, silent = true, expr = true})
map('i', [[<C-d>]], [[compe#scroll({ 'delta': -4 })]], {noremap = true, silent = true, expr = true})

