{ outputs, pkgs, ... }: {
    # Enable the X11 windowing system.

    services.xserver.desktopManager = {
        xfce.enable = false;
        gnome.enable = false;
        plasma5.enable = false;
    };


    services.xserver.windowManager = {
        qtile.enable = false;
        i3.enable = true;
        herbstluftwm.enable = false;
        awesome = {
            enable = false;
            luaModules = with pkgs.luaPackages;[
                luarocks
                    luadbi-mysql
            ];
        };
    };

    programs.sway.enable = false;

    services.xserver.displayManager = {
        gdm.enable = false;
        sddm.enable = true;
        lightdm.enable = false;
    };

    # Configure keymap in X11
    services.xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
    };
    services.gnome.gnome-keyring.enable = true;
    programs.hyprland = {
        enable = false;
        xwayland.enable = true;
    };
    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };
    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
}
