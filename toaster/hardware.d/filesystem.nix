{ ... }: {
    boot.tmp.cleanOnBoot = true;
    boot.supportedFilesystems = [ "ext4" "fat32" "ntfs" "vfat" ];
    fileSystems."/" = {
        device = "/dev/disk/by-label/NixOs";
        fsType = "ext4";
    };

    fileSystems."/home" = {
        device = "/dev/disk/by-label/Home";
        fsType = "ext4";
    };

    #fileSystems."/home" = {
    #  device = "/dev/disk/by-label/Home";
    #  fsType = "ext4";
    #};

    fileSystems."/boot/efi" = {
        device = "/dev/disk/by-label/EFI";
        fsType = "vfat";
    };

    swapDevices = [{
        device = "/dev/disk/by-label/Swap";
        priority = 60;
        size = null;
    }];
}
