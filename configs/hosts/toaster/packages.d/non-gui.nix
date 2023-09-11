{ pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    git
    neovim
    nnn
    ranger
    wget
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
      async = true;
      strategy = [
        "history"
        "completion"
      ];
    };
    setOptions = [
      "AUTO_CD"
      "AUTO_LIST"
      "AUTO_MENU"
      "AUTO_PARAM_KEYS"
      "AUTO_PARAM_SLASH"
      "AUTO_REMOVE_SLASH"
      "AUTO_PUSHD"
      # From BASH_AUTO_LIST     zoptions(1) Line 153
      "CD_SILENT"
      "EXTENDED_HISTORY"
      "HIST_FCNTL_LOCK"
      "HIST_FIND_NO_DUPS"
      "HIST_IGNORE_DUPS"
      "PUSHD_IGNORE_DUPS"
      "RM_STAR_WAIT"
      "SHARE_HISTORY"
    ];
  };
  environment.pathsToLink = [ "/share/zsh" ];
}
