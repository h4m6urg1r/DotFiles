{ pkgs, ... }: {
    home.packages = with pkgs; [
        (pkgs.writeShellScriptBin "rofi-wayland" "exec -a $0 ${pkgs.rofi-wayland}/bin/rofi $@")
        swww
    ];
}
