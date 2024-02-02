-- vim.opt.list = true
-- -- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- require("indent_blankline").setup {
--     show_end_of_line = true,
--     space_char_blankline = " ",
--     -- show_current_context = true,
--     -- show_current_context_start = true,
-- }
require("ibl").setup({
	enabled = true,
	indent = {
		char = "▏",
		tab_char = ">",
		-- tab_char = { ">", ">" },
	},
	whitespace = { highlight = { "Whitespace", "NonText" } },
	-- scope = { exclude = { language = { "lua" } } },
})
