{ config, ... }: {
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "8812au" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
}
