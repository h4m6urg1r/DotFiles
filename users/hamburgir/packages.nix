{ pkgs, ... }:
#let
#    flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
#
#    hyprland = (import flake-compat {
#        src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
#    }).defaultNix;
#in
{
    home.packages = with pkgs; [
        discord
        ranger
        firefox
        tmux
        mpv
        zathura
        variety
        rnote
        (nerdfonts.override{fonts=["Mononoki"];})
    ];

    imports = [
        #hyprland.homeManagerModules.default
        ./packages.d
    ];

    programs = {
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
        #try havoc
        #try helix
        #htop
        rofi = {
            enable = true;
        };
        #wofi = {
        #    enable = true;
        #};
        bash.enable = true;
        zellij.enable = true;
        zsh.enable = true;
        zsh.initExtra = ''
            any-nix-shell zsh --info-right | source /dev/stdin
        '';
        home-manager.enable = true;
    };
    #wayland.windowManager.hyprland = {
    #    enable = true;
    #    xwayland = {
    #        enable = true;
    #        hidpi = true;
    #    };
    #};
}
