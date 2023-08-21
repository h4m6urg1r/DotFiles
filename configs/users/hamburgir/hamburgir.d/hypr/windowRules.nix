{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
        windowrule = float, class:^(firefox)$, title:(Tree Style Tab)
    '';
}
