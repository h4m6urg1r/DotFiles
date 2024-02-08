{ ... }: {
	# TODO: checkout
	# dropbar.nvim https://github.com/Bekaboo/dropbar.nvim
	programs.nixvim.plugins.lsp = {
		enable = true;
		keymaps.lspBuf = {
			K = "hover";
			gD = "references";
			gd = "definition";
			gi = "implementation";
			gt = "type_definition";
		};
		onAttach = ''
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
		'';
		servers = {
			bashls.enable = true;
			nixd.enable = true;
			# pylsp.enable = true;
			ruff-lsp.enable = true;
			tsserver.enable = true;
		};
	};
}
