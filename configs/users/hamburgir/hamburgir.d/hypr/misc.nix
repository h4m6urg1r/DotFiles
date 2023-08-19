{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
    misc {
        disable_hyprland_logo = ${ if config.wm.hyprland.logo.enable then "false" else "true" }
        disable_splash_rendering = ${ if config.wm.hyprland.splash.enable then "false" else "true" }
        force_hypr_chan = ${ if config.wm.hyprland.forceHyprChan then "true" else "false" }
    }
    '';
}
