{ inputs, ... }: {
	imports = [
		./hy3.nix
		./input.nix
		./keybinds.nix
		./layerrule.nix
		./layoutConf.nix
		./misc.nix
		./monitors.nix
		./startup.nix
		./theme.nix
		./windowRules.nix
	];
}
