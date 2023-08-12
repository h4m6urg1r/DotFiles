{ config, ... }: let
    cfg = config.userdefined;
in {
  services.blueman.enable = cfg.bluetooth.enable;
  hardware.bluetooth = {
    enable = cfg.bluetooth.enable;
    powerOnBoot = cfg.bluetooth.powerOnBoot;
    settings = {
      General = {
        ControllerMode = cfg.bluetooth.controllerMode;
      };
    };
  };
}
