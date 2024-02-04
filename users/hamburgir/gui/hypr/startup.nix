{ config, pkgs, ... }: {
	wallpaper.desktop = {
		dir = "your_name";
		file = "MitsuhaTakiFirstMeet.jpg";
	};
	wayland.windowManager.hyprland.settings = {
		exec-once = [
			"eww open topbar-hyprland"
			# "waybar"
			# "ags"
			# "nm-applet"
			"${pkgs.wl-clipboard}/bin/wl-paste -t image --watch ${pkgs.cliphist}/bin/cliphist store"
			"${pkgs.wl-clipboard}/bin/wl-paste -t text --watch ${pkgs.cliphist}/bin/cliphist store"
			"discord"
		];
		exec = [
			# "swww query && swww img ${config.home.homeDirectory}/.config/background.jpg"
			"swww init; swww img ${config.wallpaper.desktop.output}"
		];
	};
}
