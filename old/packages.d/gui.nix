{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gparted
    # firefox
    #sway
  ];
}
