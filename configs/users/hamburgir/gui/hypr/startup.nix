{ config, ... }: {
	wayland.windowManager.hyprland.settings = {
		exec-once = [
			# "eww open topbar-hyprland"
			# "waybar"
			"ags"
			"swww init"
			"nm-applet"
		];
		exec = [
			"swww query && swww img ${config.home.homeDirectory}/.config/background.jpg"
			"discord"
		];
	};
}
