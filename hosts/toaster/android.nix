{ config, pkgs, ... }: let 
    cfg = config.userdefined;
in {
    programs.adb.enable = cfg.adb.enable;
    services.udev.packages = cfg.adb.udevPkgs;
}
