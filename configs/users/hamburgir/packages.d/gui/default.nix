{ pkgs, ... }: {
    imports = [
        ./terminalEmu.nix
        ./miscellaneous.nix
        ./socialMedia.nix
    ];
}
