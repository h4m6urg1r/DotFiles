{ inputs, config, pkgs, ... }: {
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./cmp.nix
		./colorscheme.nix
		./filemanager.nix
		./keymaps.nix
		./lsp.nix
		./options.nix
		./snippets.nix
		./statusline.nix
		./telescope.nix
		./treesitter.nix
		./ui.nix
		./utils.nix
	];
	programs.nixvim = {
		enable = true;
		extraPackages = with pkgs; [
			fd
			ripgrep
		];
	};
}
