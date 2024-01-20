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
		(python3.withPackages (ps: with ps;[ python-pam ]))
	];
}
