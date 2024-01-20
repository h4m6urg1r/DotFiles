{ config, ... }: {
	wayland.windowManager.hyprland.settings = {
		general = {
			gaps_in = config.wm.theme.windowGaps;
			gaps_out = config.wm.theme.outerGaps;
			"col.active_border" = ''rgba(89b4faee)'';
			# "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = ''rgba(45475aaa)'';
			# "col.inactive_border" = "rgba(595959aa)";
		};
		env = "XCURSOR_SIZE,16";
		decoration = {
			# See https://wiki.hyprland.org/Configuring/Variables/ for more

			rounding = 10;
			# blur = yes;
			# blur_size = 3;
			# blur_passes = 1;
			# blur_new_optimizations = true;
			blur = {
				enabled = true;
				size = 15;
				passes = 2;
				noise = 0.16;
				vibrancy = 0.77;
			};

			drop_shadow = true;
			shadow_range = 4;
			shadow_render_power = 3;
			"col.shadow" = "rgba(1a1a1aee)";
		};

	};
    # wayland.windowManager.hyprland.extraConfig = ''
        # exec-once = eww open-many topbar & swww init
        # exec = swww query && swww img ${config.home.homeDirectory}/.config/background.jpg
        # general {
            # gaps_in = ${ builtins.toString config.wm.theme.windowGaps }
            # gaps_out = ${ builtins.toString config.wm.theme.outerGaps }
            # col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            # col.inactive_border = rgba(595959aa)
# 
            # # layout = ${ config.wm.hyprland.layout }
        # }
    # '';
}
