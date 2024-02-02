{ pkgs, ... }: {
	imports = [
		./browser.nix
		./clipboard.nix
		./launcher.nix
		./media.nix
		./miscellaneous.nix
		./notifications.nix
		./screenshot.nix
		./session.nix
		./socialMedia.nix
		./terminalEmu.nix
	];
}
