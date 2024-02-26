{ config, ... }: {
	wm.hyprland = {
		logo.enable = false;
		splash.enable = false;
		forceHyprChan = false;
		wallpaper.enable = false;
	};
	wayland.windowManager.hyprland.settings = {
		general.layout = ''${config.wm.hyprland.layout}'';
		misc = {
			disable_hyprland_logo = ! config.wm.hyprland.logo.enable;
			disable_splash_rendering = ! config.wm.hyprland.splash.enable;
			# force_hypr_chan = config.wm.hyprland.forceHyprChan;
			force_default_wallpaper = 0;
		};
		binds = {
			workspace_back_and_forth = true;
		};
	};
}
