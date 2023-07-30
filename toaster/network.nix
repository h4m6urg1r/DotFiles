{ config, ... }: let 
    cfg = config.userdefined;
in {
  networking.hostName = cfg.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8022 ];
  };
  networking.networkmanager.enable = cfg.networkManager.enable;

  # Enable the OpenSSH daemon.
  services.openssh.enable = cfg.ssh.enable;
  services.openssh.ports = [
    22
    8022
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
