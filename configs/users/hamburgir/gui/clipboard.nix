{ pkgs, ... }: {
    home.packages = with pkgs; [
		cliphist
        wl-clipboard
        grim
        slurp
    ];
}
