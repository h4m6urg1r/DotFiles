{ pkgs, ... }: {
	imports = [
		# ./bin
		./editor.nix
		./filemanager.nix
		./notifications.nix
		./media.nix
		./shell.nix
		./utils.nix
		./vcs.nix
	];
	home.packages = with pkgs; [
		gobject-introspection
		gdk-pixbuf
		gtk3
		(python3.withPackages (ps: with ps;[ dbus-python pygobject3 python-pam ]))
	];
}
