{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gparted
    xclip
    gnome.zenity
    # firefox
    #sway
  ];
}
