{ pkgs, ... }: {
    imports = [
        ./clipboard.nix
        ./miscellaneous.nix
        ./notifications.nix
        ./socialMedia.nix
        ./terminalEmu.nix
    ];
}
