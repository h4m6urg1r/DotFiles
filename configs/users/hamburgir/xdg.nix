{ pkgs, ... }: {
    xsession = {
        enable = true;
        numlock.enable = false;
        windowManager.command = "Hyprland";
    };
    home = {
        pointerCursor = {
            name = "Catppuccin-Mocha-Blue-Cursors";
            package = pkgs.catppuccin-cursors.mochaBlue;
            size = 16;
            gtk.enable = true;
            x11.enable = true;
            x11.defaultCursor = "X_cursor";
        };
    };
}
