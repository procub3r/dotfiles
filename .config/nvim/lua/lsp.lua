local on_attach = function(client, bufnr)
    local bufopts = {noremap=true, silent=true, buffer=bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'go', '<c-t>', bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local cmp_default_capabilities = require('cmp_nvim_lsp').default_capabilities()

require ('lspconfig').texlab.setup {
    on_attach = on_attach,
    capabilities = cmp_default_capabilities
}

require ('lspconfig').ghcide.setup {
    on_attach = on_attach,
    capabilities = cmp_default_capabilities
}

require ('lspconfig').zls.setup {
    on_attach = on_attach,
    capabilities = cmp_default_capabilities
}

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = cmp_default_capabilities
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilities = cmp_default_capabilities
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'vsnip'}
    }, {
        {name = 'buffer'},
    }),
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
                feedkey('<Plug>(vsnip-expand-or-jump)', '')
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn['nsnip#jumpable'](-1) == 1 then
                feedkey('<Plug>(vsnip-jump-prev)', '')
            end
        end, {'i', 's'}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select=true}),
    },
})
