-- packages
require 'paq' {
    -- manage self
    'savq/paq-nvim',

    -- lsp / completion
    'saghen/blink.cmp',
    'neovim/nvim-lspconfig',

    -- colors
    'sainnhe/gruvbox-material',
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- utils
    'windwp/nvim-autopairs',
    -- 'jiangmiao/auto-pairs',
    'cloudhead/neovim-fuzzy',
    'FabijanZulj/blame.nvim',
    'nvim-treesitter/nvim-treesitter-context',
}

-- colorscheme
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

-- treesitter
require('nvim-treesitter').setup {}
-- require('nvim-treesitter.configs').setup {
--     highlight = {enable = true}
-- }

-- auto-pairs
-- TODO: figure out how to make jiangmiao/auto-pairs work pls :sob:
require('nvim-autopairs').setup({})
-- vim.g.AutoPairsCenterLine = 0
-- vim.g.AutoPairsFlyMode = 1

-- fzy
vim.keymap.set('n', '<leader>f', ':FuzzyOpen<cr>', {noremap=true})
vim.keymap.set('n', '<leader>g', ':FuzzyGrep<cr>', {noremap=true})

-- blame
require('blame').setup({})
vim.keymap.set('n', '<leader>b', ':BlameToggle<cr>', {noremap=true})

-- treesitter-context
local treesitter_context = require('treesitter-context')
treesitter_context.setup({ enable = true })
-- toggle context
vim.keymap.set('n', '<leader>c', ':TSContext toggle<cr>', {noremap=true})
-- jump to context
vim.keymap.set('n', '[c', function()
  treesitter_context.go_to_context(vim.v.count1)
end, { silent = true })
