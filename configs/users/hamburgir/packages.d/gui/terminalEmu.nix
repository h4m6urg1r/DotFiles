{ ... }: {
    programs = {
        alacritty = {
            enable = true;
        };
        wezterm = {
            enable = true;
            extraConfig = ''
                local wezterm = require "wezterm"
                local config = {}
            if wezterm.config_builder then
                config = wezterm.config_builder()
                    end
                    config.font_size = 12.4
                    config.font = wezterm.font("Mononoki Nerd Font Mono")
                    --[[
                    {
                        weight = "Regular",
                               stretch = "Normal",
                               style = "Normal"
                    }
            --]]
                config.color_scheme = 'Catppuccin Mocha'
                config.use_fancy_tab_bar = false
                config.tab_bar_at_bottom = true
                config.hide_tab_bar_if_only_one_tab = true
                --[[
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
                --]]
                config.audible_bell = "Disabled"
            return config
        '';
        };
    };
}
