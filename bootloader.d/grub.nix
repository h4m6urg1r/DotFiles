{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.fontSize = 16;
  boot.loader.grub.theme = pkgs.nixos-grub2-theme;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.copyKernels = true;
}
