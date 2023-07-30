{ ... }: {
  imports = [
    ./bootloader.d/grub.nix
    ./bootloader.d/systemd.nix
    ./bootloader.d/efi.nix
  ];
}
