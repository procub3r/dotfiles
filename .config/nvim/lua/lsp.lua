-- completion
local blink = require('blink.cmp')
blink_capabilities = blink.get_lsp_capabilities()
blink.setup({
    keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        menu = {
            draw = {
                columns = { { "label", "label_description", gap = 1 }, { 'kind' } },
            }
        },
        list = { selection = { preselect = false } },
    },
    fuzzy = { implementation = 'lua' },
})


-- list of servers
local servers = { 'clangd', 'zls' }
-- setup all servers
for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        on_attach = function(client, bufnr)
            -- lsp keybindings
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count=-1}) end, bufopts)
            vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count=1}) end, bufopts)
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'go', '<c-t>', bufopts)
        end,
        capabilities = blink_capabilities
    })
end
