{ pkgs, config, ... }: {
	gtk = {
		gtk3.bookmarks = [
			# "file://${config.home.homeDirectory}/"
			"file://${config.home.homeDirectory}/Documents"
			"file://${config.home.homeDirectory}/Downloads"
			"file://${config.home.homeDirectory}/Music"
			"file://${config.home.homeDirectory}/Pictures"
			"file://${config.home.homeDirectory}/Templates"
			"file://${config.home.homeDirectory}/Videos"
			"file:///tmp"
		];
	};
}
