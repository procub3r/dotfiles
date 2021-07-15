require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c',
        'cpp',
        'lua'
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

