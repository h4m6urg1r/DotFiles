--[[ -- Setup nvim-cmp.

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

require('cmp').setup({
    snippet = {
        -- required - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- for `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
            -- vim.fn["ultisnips#anon"](args.body) -- for `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- for `snippy` users.
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        --['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        --['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        --['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        --['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-c>'] = cmp.mapping({
            i = cmp.mapping.close(),
            c = cmp.mapping.close(),
        }),
        --['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use buffer source for `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('?', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
    --sources = cmp.config.sources({
        --{ name = 'path' }
    --}, {
        --{ name = 'cmdline' }
    --})
--}) ]]

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-c>'] = cmp.mapping({
            i = cmp.mapping.close(),
            c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            }),
            c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            }),
        }),

    },
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        elseif vim.bo.buftype == 'prompt' then
            return false
        else
            return not context.in_treesitter_capture("comment") 
            and not context.in_syntax_group("Comment")
        end
    end,
    sources = {
        { name = 'luasnip' },
        {
            name = 'path',
            option = {
                trailing_slash = true
            }
        },
        { name = 'nvim_lsp' },
        { name = 'calc' },
        -- {
        --     name = 'buffer',
        --     option = {
        --         keyword_length = 1
        --     }
        -- },
        -- { name = 'nvim_lsp_signature_help' },
        -- { name = '' },
        -- { name = '' },
        -- { name = '' },
        -- { name = '' },
    },
    snippet = {
        -- required - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- for `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
            -- vim.fn["ultisnips#anon"](args.body) -- for `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- for `snippy` users.
        end,
    },
    formatting = {
        format = require('lspkind').cmp_format()
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    }
    -- sorting = {
    --     comparators = {
    --         function(...) return cmp_buffer:compare_locality(...) end,
    --     }
    -- }
}) 

-- require'cmp'.setup.cmdline(':', {
--     sources = {
--         { name = 'cmdline' }
--     },
--     view = {
--         entries = {
--             name = 'wildmenu',
--             separator = ' '
--         }
--     }
-- })
-- require'cmp'.setup.cmdline('/', {
--     sources = {
--         { name = 'buffer' }
--     },
--     view = {
--         entries = {
--             name = 'wildmenu',
--             separator = ' '
--         }
--     }
-- })
