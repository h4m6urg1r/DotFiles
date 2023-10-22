local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
		['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
		['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
		['<C-c>'] = cmp.mapping(cmp.mapping.close(), {'i', 'c'}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.expand_or_locally_jumpable() then
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
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<CR>'] = cmp.mapping(
			cmp.mapping.confirm({
				-- behavior = cmp.ConfirmBehavior.Replace,
				select = false
			}),
			{ 'i', 'c' }
		),
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
		{
			name = 'luasnip',
			--[[ option = {
				use_show_condition = false,
				show_autosnippets = true,
			} ]]
		},
		{
			name = 'path',
			option = {
				trailing_slash = false
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
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
