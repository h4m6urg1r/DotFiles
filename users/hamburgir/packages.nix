{ inputs, config, pkgs, ... }: {
	home.packages = with pkgs; [
		tmux
		mpv
		zathura
		variety
		rnote
		(nerdfonts.override{fonts=["Mononoki" "Iosevka"];})
	];

    # imports = [
    #     #hyprland.homeManagerModules.default
    #     ./packages.d
    # ];
    # nixpkgs.overlays = [
    # ];

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
        # firefox = {
        #     enable = true;
        # };
        #try havoc
        #try helix
        #htop
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
    # specialisation = {
    #     wayland.configuration = {
    #         programs.rofi.package = pkgs.rofi-wayland;
    #     # (pkgs.writeShellScriptBin "rofi-wayland" "exec -a $0 ${pkgs.rofi-wayland.override { plugins = [ rofi-calc rofi-emoji rofi-file-browser rofi-pass rofi-power-menu ]; } }/bin/rofi $@")
    #     };
    #     x11.configuration = {
    #         programs.rofi.package = pkgs.rofi;
    #     };
    # };
}
