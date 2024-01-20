{ ... }: {
	imports = [
		./hy3.nix
		./input.nix
		./keybinds.nix
		./misc.nix
		./monitors.nix
		./startup.nix
		./theme.nix
		./windowRules.nix
	];
	wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./hyprland.conf);
}
