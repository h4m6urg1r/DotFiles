{ pkgs, ... }:
let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ./hamburgir.d/doom.d;  # Directory containing your config.el init.el
                                # and packages.el files
  };
in {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  imports = [
    <home-manager/nixos>
  ];
  users.users.hamburgir = {
    isNormalUser = true;
    description = "Shantnu Biswas";
    extraGroups = [ "networkmanager" "wheel" ];
    #packages = with pkgs; [
    #  firefox
    ##  thunderbird
    #];
  };
  home-manager.users.hamburgir = {

    home.packages = with pkgs; [
      ranger
      # firefox
      tmux
      neovim
      mpv
      zathura
      gcc
      variety
      doom-emacs
      (nerdfonts.override{fonts=["Mononoki"];})
    ];


    fonts.fontconfig.enable = false;

    gtk = {
      enable = false;
      font = {
        name = "DejaVu Sans";
        size = 11;
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-dark";
      };
      theme = {
        package = pkgs.gnome.gnome-themes-extra;
        name = "Adwaita-dark";
      };
    };

    home.enableNixpkgsReleaseCheck = true;

    # home.pointerCursor = {
    #   package = pkgs.vanilla-dmz;
    #   gtk.enable = true;
    #   name = "Vanilla-DMZ";
    #   size = 24;
    #   x11.enable = true;
    # };

    home.sessionPath = [ "$HOME/.local/bin" ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.shellAliases = {
      "la" = "ls -A";
      "ll" = "ls -l";
      "lla" = "ls -la";
    };

    home.file.".config/qtile" = {
      source = ./hamburgir.d/qtile;
      onChange = "pkill -SIGUSR1 qtile";
    };

    home.file.".config/nvim" = {
      source = ./hamburgir.d/nvim;
    };

    programs = {
      alacritty = {
        enable = true;
      };
      aria2 = {
        enable = true;
      };
      atuin = {
        enable = true;
        settings = {
          auto_sync = true;
          update_check = false;
          sync_frequency = "10m";
          search_mode = "fuzzy";
          filter_mode = "global";
          exit_mode = "return-original";
        };
      };
      autojump = {
        enable = false;
      };
      bashmount = {
        enable = true;
      };
      bat = {
        enable = true;
      };
      broot = {
        enable = true;
        settings.modal = true;
      };
      btop = {
        enable = true;
      };
      command-not-found = {
        enable = true;
      };
      eww = {
        enable = true;
        configDir = ./hamburgir.d/eww;
      };
      firefox = {
        enable = true;
      };
      gh = {
        enable = true;
        enableGitCredentialHelper = true;
        settings = {
          git_protocol = "ssh";
          editor = "nvim";
        };
      };
      git = {
        enable = true;
        userName = "the-noob-coder69";
        userEmail = "shantnuprofid@gmail.com";
        #delta.enable = true;
        diff-so-fancy.enable = true;
        ignores = [ "*.tmp" "*.temp" "tmp.*" "temp.*" ];
      };
      #try havoc
      #try helix
      rofi = {
        enable = true;
      };
      bash.enable = true;
      zsh.enable = true;
      home-manager.enable = true;
    };

    home.stateVersion = "22.11";
  };
}
