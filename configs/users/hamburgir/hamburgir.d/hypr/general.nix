{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
        general {
            gaps_in = ${ builtins.toString config.wm.theme.windowGaps }
            gaps_out = ${ builtins.toString config.wm.theme.outerGaps }
        }
    '';
}
