{ ... }: {
	# TODO: checkout
	# todo-comments https://github.com/folke/todo-comments.nvim (nixvim)
	programs.nixvim.plugins = {
		auto-save = {
			enable = true;
			keymaps.toggle = "<Leader>ta";
		};
		nvim-autopairs = {
			enable = true;
			enableAfterQuote = true;
		};
		comment-nvim = {
			enable = true;
			padding = true;
			sticky = true;
		};
	};
}
