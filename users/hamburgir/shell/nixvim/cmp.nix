{ ... }: {
	programs.nixvim.plugins.nvim-cmp = {
		enable = true;
		preselect = "None";
		mapping = let
			luasnip = "require('luasnip')";
		in {
			"<C-Space>" = "cmp.mapping.complete()";
			"<C-c>" = "cmp.mapping.close()";
			"<C-d>" = "cmp.mapping.scroll_docs(4)";
			"<C-u>" = "cmp.mapping.scroll_docs(-4)";
			"<CR>" = "cmp.mapping.confirm({ select = true })";
			"<S-Tab>" = {
				action = ''
				function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
					-- that way you will only jump inside the snippet region
					elseif ${luasnip}.jumpable(-1) then
						${luasnip}.jump(-1)
					else
						fallback()
					end
				end
				'';
				modes = [
					"i"
					"s"
				];
			};
			"<Tab>" = {
				action = ''
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
					-- that way you will only jump inside the snippet region
					elseif ${luasnip}.expand_or_jumpable() then
						${luasnip}.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end
				'';
				modes = [
					"i"
					"s"
				];
			};
		};
		snippet.expand = "luasnip";
		sources = [
			{ name = "nvim_lsp"; priority = 2; }
			{ name = "luasnip"; priority = 1; }
			{ name = "fuzzy_path"; }
			{ name = "path"; }
			{ name = "fuzzy_buffer"; }
			{ name = "buffer"; priority = 3; }
			{ name = "calc"; }
			{ name = "spell"; }
			# { name = "nvim_lsp_signature_help"; }
		];
	};
	programs.nixvim.extraConfigLuaPre = ''
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
	'';
	programs.nixvim.extraConfigLuaPost = ''
	local CompletionItemKind = {
		Text = 1,
		Method = 2,
		Function = 3,
		Constructor = 4,
		Field = 5,
		Variable = 6,
		Class = 7,
		Interface = 8,
		Module = 9,
		Property = 10,
		Unit = 11,
		Value = 12,
		Enum = 13,
		Keyword = 14,
		Snippet = 15,
		Color = 16,
		File = 17,
		Reference = 18,
		Folder = 19,
		EnumMember = 20,
		Constant = 21,
		Struct = 22,
		Event = 23,
		Operator = 24,
		TypeParameter = 25,
		}
		require('cmp.types').lsp.CompletionItemKind = vim.tbl_add_reverse_lookup(CompletionItemKind)
		
		require('cmp').setup({
			sources = {
				{
					name = 'nvim_lsp',
					entry_filter = function(entry, ctx)
						return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
					end,
				},
			},
		})
'';
}
