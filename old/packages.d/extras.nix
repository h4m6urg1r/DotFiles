{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fprintd
  ];
}
