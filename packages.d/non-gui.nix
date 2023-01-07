{ pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    ranger
    brightnessctl
    wget
    acpi
  ];
  environment.defaultPackages = [ ];
}
