{ pkgs, ... }: {
    home.packages = with pkgs; [
        wl-clipboard
        grim
        slurp
        # xclip
    ];
}
