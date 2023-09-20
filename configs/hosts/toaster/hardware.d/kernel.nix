{ config, ... }: {
    boot = {
        extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
        initrd = {
            availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
            kernelModules = [ ];
        };
        kernelModules = [ "kvm-amd" "8812au" ];
        #Silent Boot
        kernelParams = [
            "quiet"
            "splash"
            "udev.log_level=3"
        ];
        consoleLogLevel = 3;
        initrd.verbose = false;
    };
}
