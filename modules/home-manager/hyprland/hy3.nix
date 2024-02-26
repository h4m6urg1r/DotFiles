{ config, options, lib, ... }: {
	options = {
		wm = {
			gaps = {
				singleWindow = lib.mkOption {
					default = true;
					type = lib.types.bool;
					description = "Enable gaps when there is only one window";
				};
			};
		};
		hyprland.hy3 = {
			firstWindowTab = lib.mkOption {
				default = false;
				type = lib.types.bool;
				description = "Enable tabbing of first spawned window";
			};
		};
	};
	config = let
		cfg = config.wm;
		hy3 = config.hyprland.hy3;
	in {
		wayland.windowManager.hyprland.settings = {
			plugin = {
				hy3 = {
					no_gaps_when_only = ! cfg.gaps.singleWindow;
					node_collapse_policy = 1;
					tab_first_window = hy3.firstWindowTab;

					tabs = {
						height = 5;
						padding = 8;
						render_text = false;
					};
				};
			};
		};
	};
}
