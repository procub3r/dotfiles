local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

map('n', [[<leader>w]], [[:w<cr>]], {noremap=true})
map('n', [[<leader>q]], [[:q<cr>]], {noremap=true})
map('n', [[<leader>h]], [[<C-w>h]], {noremap=true})
map('n', [[<leader>j]], [[<C-w>j]], {noremap=true})
map('n', [[<leader>k]], [[<C-w>k]], {noremap=true})
map('n', [[<leader>l]], [[<C-w>l]], {noremap=true})
map('n', [[<leader>s]], [[:!]], {noremap=true})

map('n', [[<leader>tn]], [[:tabnew<cr>]], {noremap=true})
map('n', [[<leader>tl]], [[:tabnext<cr>]], {noremap=true})
map('n', [[<leader>th]], [[:tabprev<cr>]], {noremap=true})
map('n', [[<leader>tw]], [[:tabclose<cr>]], {noremap=true})

map('n', [[<leader>f]], [[:Explore<cr>]], {noremap=true})
map('n', [[<leader>n]], [[:FuzzyOpen<cr>]], {noremap=true})
map('n', [[<leader>g]], [[:FuzzyGrep<cr>]], {noremap=true})

-- exit terminal with escape key
map('t', [[<Esc>]], [[<C-\><C-N>]], {noremap=true})
