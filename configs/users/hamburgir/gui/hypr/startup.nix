{ config, pkgs, ... }: {
	wayland.windowManager.hyprland.settings = {
		exec-once = [
			"eww open topbar-hyprland"
			# "waybar"
			# "ags"
			"swww init"
			# "nm-applet"
			"${pkgs.wl-clipboard}/bin/wl-paste -t image --watch ${pkgs.cliphist}/bin/cliphist store"
			"${pkgs.wl-clipboard}/bin/wl-paste -t text --watch ${pkgs.cliphist}/bin/cliphist store"
		];
		exec = [
			"swww query && swww img ${config.home.homeDirectory}/.config/background.jpg"
			"discord"
		];
	};
}
