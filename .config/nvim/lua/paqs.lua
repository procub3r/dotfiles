-- git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

require 'paq' {
    'savq/paq-nvim';

    -- lang:
    'nvim-treesitter/nvim-treesitter';
    'neovim/nvim-lspconfig';
    'williamboman/nvim-lsp-installer';
    -- cmp
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/vim-vsnip';

    -- aesthetics:
    'sainnhe/sonokai';
    'kyazdani42/nvim-web-devicons';

    -- misc:
    'windwp/nvim-autopairs';
    'kyazdani42/nvim-tree.lua';
    'cloudhead/neovim-fuzzy';
}
