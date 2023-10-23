{ pkgs, ... }: {
	imports = [
		./clipboard.nix
		./media.nix
		./miscellaneous.nix
		./notifications.nix
		./session.nix
		./socialMedia.nix
		./terminalEmu.nix
	];
}
