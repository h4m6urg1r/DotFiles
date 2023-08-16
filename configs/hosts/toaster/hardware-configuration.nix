# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ modulesPath, nixpkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./hardware.d/kernel.nix
    ./hardware.d/filesystem.nix
    ./hardware.d/cpu.nix
    ./hardware.d/gpu.nix
    ./hardware.d/asusBattery.nix
    #./hardware.d/networking.nix
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.asus.battery = {
    enableChargeUptoScript = true;
    chargeUpto = 60;
  };
}
