{ ... }: {
	wayland.windowManager.hyprland.settings = {
		plugin = {
			hy3 = {
				no_gaps_when_only = true;
				node_collapse_policy = 1;
				tab_first_window = true;

				tabs = {
					height = 5;
					padding = 8;
					render_text = false;
				};
				autotile = {
					enable = true;
					trigger_width = 800;
					trigger_height = 500;
				};
			};
		};
	};
}
