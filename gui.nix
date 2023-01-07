{ ... }: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;
  
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.lightdm.enable = false;

  services.xserver.windowManager.qtile.enable = true;
  programs.sway.enable = false;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
