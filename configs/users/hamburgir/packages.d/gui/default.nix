{ pkgs, ... }: {
    imports = [
        ./miscellaneous.nix
        ./notifications.nix
        ./socialMedia.nix
        ./terminalEmu.nix
    ];
}
