{ pkgs }: rec {
  necessary = pkgs.buildEnv {
    name = "Tools required irrelevent of gui/non-gui system";
    paths = with pkgs;[
      acpi
      brightnessctl
      unzip
      usbutils
      zip
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
  clitools = pkgs.buildEnv {
    name = "Tools for cli";
    paths = with pkgs;[
      bat 
      fd
      git
      nvim
      ranger
      ripgrep
      tree
      wget
      zsh
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
