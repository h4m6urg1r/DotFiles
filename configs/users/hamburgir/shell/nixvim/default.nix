{ inputs, config, pkgs, ... }: {
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./colorscheme.nix
		./keymaps.nix
		./lsp.nix
		./options.nix
		./statusline.nix
		./telescope.nix
		./utils.nix
	];
	programs.nixvim = {
		enable = true;
		extraPackages = with pkgs; [ ripgrep ];
	};
}
