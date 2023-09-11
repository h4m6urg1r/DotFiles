{ pkgs, ... }: {
    imports = [
        ./editor.nix
        ./filemanager.nix
        ./shell.nix
        ./vcs.nix
    ];
}
