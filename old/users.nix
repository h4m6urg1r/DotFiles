{ ... }:{
  imports = [
    <home-manager/nixos>
    ./users.d/hamburgir.nix
  ];
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
}
