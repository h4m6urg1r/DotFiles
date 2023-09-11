{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gparted
    gnome.zenity
    dunst
    libnotify
    # xorg
    xclip
    xdotool
    # wayland
    wl-clipboard
    wtype
    ydotool
    # firefox
  ];
}
