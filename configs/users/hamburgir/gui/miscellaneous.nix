{ inputs, pkgs, ... }: {
	imports = [
		inputs.ags.homeManagerModules.default
	];
	nixpkgs.overlays = [
		inputs.eww.overlays.default
		inputs.rust-overlay.overlays.default
	];

	programs = {
		ags = {
			enable = true;
			
			# null or path, leave as null if you don't want hm to manage the config
			configDir =	./ags;

			# packages to add to gjs's runtime
			extraPackages = [ pkgs.libsoup_3 ];
		};
		eww = {
			enable = true;
			configDir = ./eww;
			# package = pkgs.eww-wayland;
			package = (pkgs.writeShellScriptBin "eww" ''
			[[ "$1" -eq "daemon" ]] && echo "${pkgs.eww-wayland}/bin/eww" > /tmp/eww.cmd
			${pkgs.eww-wayland}/bin/eww "$@"
			'');
		};
	};
	home.packages = with pkgs; [
		helvum
		swww
	];
}
