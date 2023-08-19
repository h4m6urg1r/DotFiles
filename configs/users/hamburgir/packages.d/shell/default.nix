{ pkgs, ... }: {
    imports = [
        ./editor.nix
        ./vcs.nix
    ];
}
