{ pkgs, ... }: {
    imports = [
        ./vcs.nix
        ./terminalEmu.nix
        ./miscellaneous.nix
    ];
}
