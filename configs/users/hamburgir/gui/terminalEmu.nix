{ ... }: {
	imports = [
		./wezterm
	];
	programs = {
		alacritty = {
			enable = true;
		};
		wezterm = {
			enable = true;
		};
	};
}
