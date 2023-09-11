{ pkgs, ... }: {
    imports = [
        ./clipboard.nix
        ./media.nix
        ./miscellaneous.nix
        ./notifications.nix
        ./socialMedia.nix
        ./terminalEmu.nix
    ];
}
