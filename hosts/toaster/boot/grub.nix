{ grub2-themes, pkgs, config, ... }: {
	wallpaper.grub = {
		dir = "miscellaneous";
		file = "GirlStandingDuskWithBirds.jpg";
	};
	boot.loader.grub.enable = true;
	boot.loader.grub.efiSupport = true;
	boot.loader.grub.device = "nodev";
	# boot.loader.grub.fontSize = 16;
	boot.loader.grub2-theme = {
		enable = true;
		theme = "tela";
		icon = "color";
		screen = "1080p";
		splashImage = config.wallpaper.grub.output;
		# bootMenuConfig = ;
		# terminalConfig = ;
		# footer = ;
	};
	# boot.loader.grub.theme = pkgs.nixos-grub2-theme;
	boot.loader.grub.useOSProber = true;
	boot.loader.grub.copyKernels = true;
}
