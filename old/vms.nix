{ pkgs, ... }:
{
  boot.enableContainers = true;
  virtualisation = {
    waydroid.enable = false;
    # lxd.enable = true;
  };
}
