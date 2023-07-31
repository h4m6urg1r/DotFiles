{ pkgs, ... }:
#let
#    flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
#
#    hyprland = (import flake-compat {
#        src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
#    }).defaultNix;
#in
{
    home.packages = with pkgs {allowUnfree = true;}; [
        discord
        ranger
        firefox
        tmux
        neovim
        mpv
        zathura
        variety
        rnote
        (nerdfonts.override{fonts=["Mononoki"];})
    ];

    imports = [
        #hyprland.homeManagerModules.default
    ];

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
        #htop
        rofi = {
            enable = true;
        };
        #wofi = {
        #    enable = true;
        #};
        wezterm = {
            enable = true;
            extraConfig = ''
                local wezterm = require "wezterm"
                local config = {}
                if wezterm.config_builder then
                    config = wezterm.config_builder()
                end
                config.font = wezterm.font("Mononoki Nerd Font Mono")
                    --[[
                    {
                        weight = "Regular",
                        stretch = "Normal",
                        style = "Normal"
                    }
                    --]]
                config.color_scheme = 'Dracula'
                config.window_background_gradient = {
                    orientation = {
                        Linear = {
                            angle = 90
                        }
                    },
                    colors = {
                        '#0f0c29',
                        '#302b63',
                        '#24243e',
                    },
                }
                return config
            '';
        };
        bash.enable = true;
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
