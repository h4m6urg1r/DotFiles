{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
        exec-once = eww open-many topbar & swww init
        exec = swww query && swww img /home/hamburgir/repo/wallpapers/1506250.jpg
        general {
            gaps_in = ${ builtins.toString config.wm.theme.windowGaps }
            gaps_out = ${ builtins.toString config.wm.theme.outerGaps }
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)

            # layout = ${ config.wm.hyprland.layout }
        }
    '';
}
