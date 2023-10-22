{ pkgs, ... }: {
    gtk = {
        enable = true;
        font = {
            name = "DejaVu Sans";
            size = 11;
        };
        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };
        theme = {
            package = pkgs.gnome.gnome-themes-extra;
            name = "Adwaita-dark";
        };
    };

    # home.pointerCursor = {
    #   package = pkgs.vanilla-dmz;
    #   gtk.enable = true;
    #   name = "Vanilla-DMZ";
    #   size = 24;
    #   x11.enable = true;
    # };
    fonts.fontconfig.enable = false;
}
