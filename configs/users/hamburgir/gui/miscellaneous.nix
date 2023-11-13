{ pkgs, ... }: {
	home.packages = with pkgs; [
		helvum
		swww
	];
}
