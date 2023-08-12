{ pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    neovim
    ranger
    unrar
    unzip
    wget
  ];
}
