{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gparted
    xclip
    gnome.zenity
    pkgs.dunst
    libnotify
    # firefox
    #sway
  ];
}
