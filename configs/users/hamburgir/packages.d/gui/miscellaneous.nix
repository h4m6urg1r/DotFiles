{ pkgs, ... }: {
    home.packages = with pkgs; [
        (pkgs.writeShellScriptBin "rofi-wayland" "exec -a $0 ${pkgs.rofi-wayland.override { plugins = [ rofi-calc rofi-emoji rofi-file-browser rofi-pass rofi-power-menu ]; } }/bin/rofi $@")
        swww
    ];
}
