{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # fprintd
    distrobox
    lz4
    unrar
    unzip
    # docker
  ];
}
