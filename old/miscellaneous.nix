{ pkgs, ... }:{
  #imports = [
  #  ./
  #]

  appstream.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #services.fprintd.enable = true;

  #services.fprintd.tod.enable = true;

  ##services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090; #(If the vfs0090 Driver does not work, use the following driver)

  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix; #(On my device it only worked with this driver)
}
