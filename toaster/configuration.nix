# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: with pkgs.lib; {
    imports = [
        ./hardware-configuration.nix
        ./android.nix
        ./audio.nix
        ./bluetooth.nix
        ./bootloader.nix
        ./environment.nix
        ./gui.nix
        ./miscellaneous.nix
        ./mysql.nix
        ./network.nix
        ./packages.nix
        ./users.nix
        ./vms.nix
        ./zerotier.nix
    ];

    options.userdefined = {
        # enableSsh = mkOption {
        #     default = true;
        #     type = pkgs.lib.types.bool;
        #     description = "";
        # };
        hostname = mkOption {
            default = "toaster";
            type = types.str;
            description = "Hostname of the machine";
        };
        ssh = {
            enable = mkOption {
                default = true;
                type = types.bool;
                description = "Enable ssh";
            };
        };
        networkManager = {
            enable = mkOption {
                default = true;
                type = types.bool;
                description = "Use network manager for managing internet connections";
            };
        };
        containers = {
            enable = mkOption {
                default = true;
                type = types.bool;
                description = "Enable nixos containers";
            };
        };
        waydroid = {
            enable = mkOption {
                default = false;
                type = types.bool;
                description = "Install android emulator for linux on waydroid";
            };
        };
        adb = {
            enable = mkOption {
                default = true;
                type = types.bool;
                description = "Install android debug bridge";
            };
            udevPkgs = mkOption {
                default = [ pkgs.android-udev-rules ];
                type = types.listOf types.package;
                description = "Packages required during android development";
            };
        };
        gui = {
            enable = mkOption {
                default = true;
                type = types.bool;
                description = "Enable gui";
            };
        };
        bluetooth = {
            enable = mkOption {
                default = true;
                type = types.bool;
                description = "Enable bluetooth";
            };
            powerOnBoot = mkOption {
                default = false;
                type = types.bool;
                description = "Turn blutooth on during boot";
            };
            controllerMode = mkOption {
                default = "bredr";
                type = types.str;
                description = "Controller mode for bluetooth";
            };
        };
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # nix = {
    #     extraOptions = ''
    #         experimental-features = nix-command flakes
    #         '';
    # };

    # List services that you want to enable:

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    config.system.stateVersion = "23.05"; # Did you read the comment?

}
