{ pkgs, ... }: {
    imports = [
        ./editor.nix
        ./filemanager.nix
        ./media.nix
        ./shell.nix
        ./vcs.nix
    ];
}
