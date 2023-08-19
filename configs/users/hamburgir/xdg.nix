{ pkgs, ... }: {
    xsession = {
        enable = true;
        numlock.enable = false;
        windowManager.command = "sway";
    };
    home = {
        pointerCursor = {
            name = "Catppuccin-Mocha-Blue-Cursors";
            package = pkgs.catppuccin-cursors.mochaBlue;
            size = 24;
            gtk.enable = true;
            x11.enable = true;
            x11.defaultCursor = "X_cursor";
        };
    };
}
