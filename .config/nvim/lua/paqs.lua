-- git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

require 'paq-nvim' {
    'savq/paq-nvim';

    -- lang:
    'nvim-treesitter/nvim-treesitter';
    'hrsh7th/nvim-compe';
    'neovim/nvim-lspconfig';
    'williamboman/nvim-lsp-installer';

    -- aesthetics:
    'sainnhe/sonokai';
    'kyazdani42/nvim-web-devicons';

    -- misc:
    'windwp/nvim-autopairs';
    'kyazdani42/nvim-tree.lua';
}
