{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # fprintd
    distrobox
    # docker
  ];
}
