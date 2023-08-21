{ pkgs, ... }: {
    imports = [
        ./editor.nix
        ./filemanager.nix
        ./vcs.nix
    ];
}
