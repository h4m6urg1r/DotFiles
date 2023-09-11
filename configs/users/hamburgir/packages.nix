{ inputs, pkgs, ... }: {
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
    nixpkgs.overlays = [
        inputs.eww.overlays.default
        inputs.rust-overlay.overlays.default
    ];

    programs = {
        aria2 = {
            enable = true;
        };
        atuin = {
            enable = false;
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
            package = pkgs.eww-wayland;
        };
        firefox = {
            enable = true;
        };
        #try havoc
        #try helix
        #htop
        rofi = {
            enable = false;
            plugins = with pkgs; [
                rofi-calc
                rofi-emoji
                rofi-pass
                rofi-power-menu
                rofi-file-browser
            ];
        };
        #wofi = {
        #    enable = true;
        #};
        bash.enable = true;
        zellij.enable = true;
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
