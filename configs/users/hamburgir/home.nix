{ config, lib, outputs, options, pkgs, ... }: {
    imports = [
        ./environment.nix
        ./files.nix
        ./gui.nix
        ./hamburgir.d/hypr
        ./keybinds.nix
        ./packages.nix
        ./sh.nix
        ./theme.nix
        ./xdg.nix
    ];

    options = {
        wm = {
            rules = {
                focusType = lib.mkOption{
                    default = 2;
                    type = lib.types.number;
                    description = ''
                    0: Focus does not follow mouse, mouse and keyboard have same focus
                    1: Focus follows mouse, mouse and keyboard have same focus
                    2: Keyboard focus follows mouse click
                    3: Keyboard focus and mouse focus are different
                    '';
                };
                mouseRefocus = lib.mkOption {
                    default = false;
                    type = lib.types.bool;
                    description = "Read on hyprland wiki";
                };
            };
            keys = {
                mod = lib.mkOption{
                    default = "super";
                    type = lib.types.str;
                    description = "Default mod key";
                };
                keybinds = {
                    movement = {
                        
                    };
                };
            };
            theme = {
                windowGaps = lib.mkOption {
                    default = 4;
                    type = lib.types.number;
                    description = "Gaps between windows";
                };
                outerGaps = lib.mkOption {
                    default = config.wm.theme.windowGaps * 2;
                    type = lib.types.number;
                    description = "Gaps outside window area";
                };
            };
            gesture = {
                enable = lib.mkOption{
                    default = true;
                    type = lib.types.bool;
                };
                switchWorkspace = lib.mkOption{
                    default = true;
                    type = lib.types.bool;
                    description = "Use gestures to switch workspace";
                };
            };
            hyprland = {
                logo.enable = lib.mkOption {
                    default = true;
                    type = lib.types.bool;
                    description = "Enable hyprland logo";
                };
                splash.enable = lib.mkOption {
                    default = true;
                    type = lib.types.bool;
                    description = "Enable hyprland quotes at bottom";
                };
                forceHyprChan = lib.mkOption{
                    default = true;
                    type = lib.types.bool;
                    description = "Anime character rendering UwU";
                };
                layout = lib.mkOption {
                    default = "hy3";
                    type = lib.types.str;
                    description = "Default layout";
                };
            };
        };
        hardware = {
            keyboard = {
                numlock = lib.mkOption{
                    default = false;
                    type = lib.types.bool;
                    description = "Turn on numlock at startup";
                };
            };
            touchpad = {
                naturalScroll = lib.mkOption{
                    default = false;
                    type = lib.types.bool;
                    description = "Content moves in the direction of finger movement";
                };
                dragLock = lib.mkOption{
                    default = true;
                    type = lib.types.bool;
                    description = "Locks dragging for some time, gives a bit of time to reposition finger";
                };
                tapAndDrag = lib.mkOption{
                    default = true;
                    type = lib.types.bool;
                    description = "Enables tap and drag";
                };
            };
            mouse = {
                sensitivity = lib.mkOption{
                    default = 0.0;
                    type = lib.types.float;
                    description = "Mouse sensitivity from -1.0 to 1.0";
                };
            };
        };
    };
    # options.hyprland.config.file = lib.mkOption{
    #     default = "";
    #     type = lib.types.;
    # };

    config = {
        home = {
            username = "hamburgir";
            homeDirectory = "/home/hamburgir";

            enableNixpkgsReleaseCheck = true;

            sessionPath = [ "$HOME/.local/bin" ];
            stateVersion = "23.05";
        };

        nixpkgs.config = {
            overlays = [
                # Add overlays your own flake exports (from overlays and pkgs dir):
                outputs.overlays.additions
                outputs.overlays.modifications
                outputs.overlays.unstable-packages

                # You can also add overlays exported from other flakes:
                # neovim-nightly-overlay.overlays.default

                # Or define it inline, for example:
                # (final: prev: {
                #   hi = final.hello.overrideAttrs (oldAttrs: {
                #     patches = [ ./change-hello-to-hi.patch ];
                #   });
                # })
            ];
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };

        manual.manpages.enable = true;
        manual.html.enable = true;
        manual.json.enable = true;
        services.network-manager-applet.enable = true;
    };
}
