local wezterm = require "wezterm"
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end
config.font_size = 12.7
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
