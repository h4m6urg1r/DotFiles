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

    # imports = [
    #     #hyprland.homeManagerModules.default
    #     ./packages.d
    # ];
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
            enable = true;
            plugins = with pkgs; [
                rofi-calc
                rofi-emoji
                rofi-pass
                rofi-power-menu
                rofi-file-browser
            ];
            configPath = "$HOME/.cache/rofi/config.rasi";
            # theme = let
            #     inherit (config.lib.formats.rasi) mkLiteral;
            # in {
            #     ""
            # };
# /*****----- Configuration -----*****/
# configuration {
#   modi:                       "drun";
#     show-icons:                 true;
#     display-drun:               "";
#   drun-display-format:        "{name}";
# }
#
# /*****----- Global Properties -----*****/
# @import                          "shared/colors.rasi"
# @import                          "shared/fonts.rasi"
#
# /*****----- Main Window -----*****/
# window {
#     transparency:                "real";
#     location:                    center;
#     anchor:                      center;
#     fullscreen:                  true;
#     width:                       1366px;
#     height:                      768px;
#     x-offset:                    0px;
#     y-offset:                    0px;
#
#     enabled:                     true;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               0px;
#     border-color:                @selected;
#     background-color:            black / 10%;
#     cursor:                      "default";
# }
#
# /*****----- Main Box -----*****/
# mainbox {
#     enabled:                     true;
#     spacing:                     100px;
#     margin:                      0px;
#     padding:                     100px 225px;
#     border:                      0px solid;
#     border-radius:               0px 0px 0px 0px;
#     border-color:                @selected;
#     background-color:            transparent;
#     children:                    [ "inputbar", "listview" ];
# }
#
# /*****----- Inputbar -----*****/
# inputbar {
#     enabled:                     true;
#     spacing:                     10px;
#     margin:                      0% 28%;
#     padding:                     10px;
#     border:                      1px solid;
#     border-radius:               6px;
#     border-color:                white / 25%;
#     background-color:            white / 5%;
#     text-color:                  @foreground;
#     children:                    [ "prompt", "entry" ];
# }
#
# prompt {
#     enabled:                     true;
#     background-color:            transparent;
#     text-color:                  inherit;
# }
# textbox-prompt-colon {
#     enabled:                     true;
#     expand:                      false;
#     str:                         "::";
#     background-color:            transparent;
#     text-color:                  inherit;
# }
# entry {
#     enabled:                     true;
#     background-color:            transparent;
#     text-color:                  inherit;
#     cursor:                      text;
#     placeholder:                 "Search";
#     placeholder-color:           inherit;
# }
#
# /*****----- Listview -----*****/
# listview {
#     enabled:                     true;
#     columns:                     7;
#     lines:                       4;
#     cycle:                       true;
#     dynamic:                     true;
#     scrollbar:                   false;
#     layout:                      vertical;
#     reverse:                     false;
#     fixed-height:                true;
#     fixed-columns:               true;
#     
#     spacing:                     0px;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               0px;
#     border-color:                @selected;
#     background-color:            transparent;
#     text-color:                  @foreground;
#     cursor:                      "default";
# }
# scrollbar {
#     handle-width:                5px ;
#     handle-color:                @selected;
#     border-radius:               0px;
#     background-color:            @background-alt;
# }
#
# /*****----- Elements -----*****/
# element {
#     enabled:                     true;
#     spacing:                     15px;
#     margin:                      0px;
#     padding:                     35px 10px;
#     border:                      0px solid;
#     border-radius:               15px;
#     border-color:                @selected;
#     background-color:            transparent;
#     text-color:                  @foreground;
#     orientation:                 vertical;
#     cursor:                      pointer;
# }
# element normal.normal {
#     background-color:            transparent;
#     text-color:                  @foreground;
# }
# element selected.normal {
#     background-color:            white / 5%;
#     text-color:                  @foreground;
# }
# element-icon {
#     background-color:            transparent;
#     text-color:                  inherit;
#     size:                        72px;
#     cursor:                      inherit;
# }
# element-text {
#     background-color:            transparent;
#     text-color:                  inherit;
#     highlight:                   inherit;
#     cursor:                      inherit;
#     vertical-align:              0.5;
#     horizontal-align:            0.5;
# }
#
# /*****----- Message -----*****/
# error-message {
#     padding:                     100px;
#     border:                      0px solid;
#     border-radius:               0px;
#     border-color:                @selected;
#     background-color:            black / 10%;
#     text-color:                  @foreground;
# }
# textbox {
#     background-color:            transparent;
#     text-color:                  @foreground;
#     vertical-align:              0.5;
#     horizontal-align:            0.0;
#     highlight:                   none;
# }
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
    specialisation = {
        wayland.configuration = {
            programs.rofi.package = pkgs.rofi-wayland;
        # (pkgs.writeShellScriptBin "rofi-wayland" "exec -a $0 ${pkgs.rofi-wayland.override { plugins = [ rofi-calc rofi-emoji rofi-file-browser rofi-pass rofi-power-menu ]; } }/bin/rofi $@")
        };
        x11.configuration = {
            programs.rofi.package = pkgs.rofi;
        };
    };
}
