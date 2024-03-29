{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
        # exec-once = eww open-many topbar & swww init & nm-applet --indicator &
        exec-once = waybar & swww init & nm-applet --indicator &
        exec = swww query && swww img ${config.home.homeDirectory}/.config/background.jpg
        general {
            gaps_in = ${ builtins.toString config.wm.theme.windowGaps }
            gaps_out = ${ builtins.toString config.wm.theme.outerGaps }
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)

            # layout = ${ config.wm.hyprland.layout }
        }
    '';
}
