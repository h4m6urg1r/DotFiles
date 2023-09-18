{ ... }: {
    imports = [
        ./efi.nix
        ./grub.nix
        ./plymouth.nix
        ./systemd.nix
    ];
}
