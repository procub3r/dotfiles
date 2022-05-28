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
map('n', [[<leader>b]], [[<C-^>]], {noremap = true})

-- tabs --
map('n', [[<leader>tn]], [[:tabnew<cr>]], {noremap = true})
map('n', [[<leader>tl]], [[:tabnext<cr>]], {noremap = true})
map('n', [[<leader>th]], [[:tabprev<cr>]], {noremap = true})
map('n', [[<leader>tl]], [[:tabnext<cr>]], {noremap = true})
map('n', [[<leader>tc]], [[:tabclose<cr>]], {noremap = true})

-- terminal --
map('t', [[<Esc>]], [[<C-\><C-N>]], {noremap = true})

-- nvimtree --
map('n', [[<leader>f]], [[:NvimTreeToggle<cr>]], {noremap = true})
map('n', [[<leader>F]], [[:NvimTreeRefresh<cr>]], {noremap = true})

-- fuzzy find --
map('n', [[<leader>n]], [[:FuzzyOpen<cr>]], {noremap = true})
map('n', [[<leader>g]], [[:FuzzyGrep<cr>]], {noremap = true})
