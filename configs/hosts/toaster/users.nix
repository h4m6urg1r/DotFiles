{ ... }: {
  #imports = [
  #  # <home-manager/nixos>
  #  ./users.d/hamburgir.nix
  #];
  users.users.hamburgir = {
    isNormalUser = true;
    description = "Shantnu Biswas";
    extraGroups = [ "adbusers" "networkmanager" "wheel" "storage" ];
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFe5uWV+2gQn9kJmE5y5xiQfZFzN/KtanbdA/SSF4+drNuFjAT8yORQejnB6drfn/kdlgITu7OZ+ikx8m2/VfjoKgAeVvPYN/7Hr0s8JdIqf4HmU9wc2SXHWP7my9kNDwzhpkucS3pT0T8kiLevNTY98N/hWmMqyVuqqhVB+g3mcAZVmQ== u0_a166@localhost"
    ];
  };
  # home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;
}
