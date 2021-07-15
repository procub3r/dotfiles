vim.o.completeopt = 'menuone,noselect'

require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        nvim_lsp = true;
        nvim_lua = true;
        -- vsnip = true;
    };
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- tab completion --
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    else
        return t '<Tab>'
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<C-h>'
    end
end

local npairs = require('nvim-autopairs')
_G.MUtils = {}
vim.g.completion_confirm_key = ''
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            return vim.fn['compe#confirm'](npairs.esc('<cr>'))
        else
            return npairs.esc('<cr>')
        end
    else
        return npairs.autopairs_cr()
    end
end

local map = vim.api.nvim_set_keymap
map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
map('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

