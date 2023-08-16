# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
    # example = pkgs.callPackage ./example { };
    rofi-wayland-custom = (pkgs.writeShellScriptBin "rofi-wayland" "exec -a $0 ${pkgs.rofi-wayland}/bin/rofi $@");
}
