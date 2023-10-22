{ pkgs, ... }: {
	imports = [
		./editor.nix
		./filemanager.nix
		./media.nix
		./shell.nix
		./utils.nix
		./vcs.nix
	];
}
