{ config, inputs, pkgs, ... }: {
	xsession.windowManager.i3 = {
		enable = true;
		config = {
			assigns = {
				"4" = [{ class = "^discord"; }];
			};
			modifier = "Mod4";
			terminal = "wezterm";
			startup = [
				{ command = "discord"; }
			];
			workspaceAutoBackAndForth = true;
		};
	};
	xsession.windowManager.awesome = {
		enable = false;
		luaModules = with pkgs.luaPackages; [
			luarocks
			luadbi-mysql
			lgi
		];
	};

	wayland.windowManager.sway = {
		enable = true;
		config = {
			menu = "rofi -show drun";
			terminal = "wezterm";
			assigns = {
				"2" = [{ app_id = "^firefox$"; }];
				"4" = [{ app_id = "^discord$"; }];
			};
			floating.criteria = [
				{
					title = "^Picture-in-Picture$";
					app_id = "^firefox$";
				}
				{
					title = "[Ee]xtension.*[Tt]ree\\s[Ss]tyle\\s[Tt]ab.*[Cc]lose\\s[Tt]abs";
					app_id = "^firefox$";
				}
			];
			window.commands = [
				{
					criteria = {
						app_id = "^pavucontrol$";
					};
					command = "move window to scratchpad";
				}
				{
					criteria = {
						title = "^Picture-in-Picture$";
						app_id = "^firefox$";
					};
					command = "sticky enable";
				}
			];
			modifier = "Mod4";
			input = {
				"type:touchpad" = {
					tap = "enabled";
					drag = "enabled";
					drag_lock = "enabled";
					middle_emulation = "enabled";
				};
			};
			startup = [
				{ command = "discord"; }
				{ command = "pavucontrol"; }
				# { command = ""; }
				{ command = "$(home-manager generations | head -1 | awk '{print $7 \"/specialisation/wayland\"}')"; }
			];
			output = {
				eDP-1 = {
					bg = "~/repo/wallpapers/1682160.jpg fill";
				};
			};
		};
	};
	wayland.windowManager.hyprland = {
		enable = true;
		# extraConfig = config.hyprland.config.file;
		extraConfig = (builtins.readFile ../hamburgir.d/hypr/hyprland.conf);
		plugins = [
			# inputs.hy3.packages.x86_64-linux.hy3
		];
	};
}
