{ pkgs, ... }: {
  imports = [
    ./packages.d/gui.nix
    ./packages.d/non-gui.nix
    # ./packages.d/extras.nix
  ];
}
