{ inputs, options, lib, config, ... }: {
	options = {
		wm = {
			gaps = {
				distance = lib.mkOption {
					default = 2;
					type = lib.types.int;
					description = "WM sexy gaps ;)";
				};
				outerDistance = lib.mkOption {
					default = config.wm.gaps.distance * 2;
					type = lib.types.int;
					description = "WM sexy gaps ;)";
				};
			};
			blur = {
				enable = lib.mkOption {
					default = false;
					type = lib.types.bool;
					description = "Enable or disable blur";
				};
				size = lib.mkOption {
					default = 4;
					type = lib.types.int;
					description = "Enable or disable blur";
				};
				passes = lib.mkOption {
					default = 2;
					type = lib.types.int;
					description = "Enable or disable blur";
				};
				vibrancy = lib.mkOption {
					default = 0.77;
					type = lib.types.float;
					description = "Blur vibrancy";
				};
			};
		};
	};
	config = let
		gaps = config.wm.gaps;
	in {
		wayland.windowManager.hyprland.settings = {
			general = {
				gaps_in = gaps.distance;
				gaps_out = gaps.outerDistance;
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
				blur = let
					wallpaper = config.wallpaper.hyprland.blur;
					blur = config.wm.blur;
				in {
					enabled = blur.enable;
					size = if (wallpaper.size != null) then wallpaper.size else blur.size;
					passes = if (wallpaper.passes != null) then wallpaper.size else blur.passes;
					# noise = 0.16;
					vibrancy = blur.vibrancy;
				};

				drop_shadow = true;
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(1a1a1aee)";
			};
			animations = {
				enabled = "yes";

				# Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

				bezier = [
					"myBezier, 0.05, 0.9, 0.1, 1.05"
					"easeInOutBack, 0.68, -0.55, 0.265, 1.55"
					"easeInBack, 0.36, 0, 0.66, -0.56"
					"easeOutBack, 0.34, 1.56, 0.64, 1"
					"easeOutCircle, 0, 0.55, 0.45, 1"
				];

				animation = [
					# "windows, 1, 7, myBezier"
					# "windowsOut, 1, 7, default, popin 80%"

					"windows, 1, 8, easeInOutBack"
					"windowsOut, 1, 8, easeInOutBack"

					"border, 1, 10, default"
					"borderangle, 1, 8, default"

					# "fade, 1, 7, default"
					"fade, 1, 7, easeInOutBack"

					"workspaces, 1, 5, easeOutBack"
				];
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
	
				# # layout = ${ config.wm.hyprland.layout }
			# }
		# '';
	};
}
