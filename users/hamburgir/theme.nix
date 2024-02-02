{ pkgs, ... }: {
	gtk = {
		enable = true;
		font = {
			name = "DejaVu Sans";
			size = 11;
		};
		iconTheme = {
			package = pkgs.papirus-icon-theme;
			name = "Papirus-Dark";
		};
		theme = {
			# name = "Adwaita-dark";
			# package = pkgs.gnome.gnome-themes-extra;
			name = "Catppuccin-Mocha-Standard-Blue-Dark";
			package = pkgs.catppuccin-gtk.override {
				accents = [ "blue" ];
				size = "standard";
				tweaks = [ "rimless" ];
				variant = "mocha";
			};
		};
	};

	qt = {
		enable = true;
		# platformTheme = "gtk3";
		style = {
			package = pkgs.adwaita-qt;
			name = "adwaita-dark";
		};
	};

	# home.pointerCursor = {
	#   package = pkgs.vanilla-dmz;
	#   gtk.enable = true;
	#   name = "Vanilla-DMZ";
	#   size = 24;
	#   x11.enable = true;
	# };
	fonts.fontconfig.enable = false;
}
