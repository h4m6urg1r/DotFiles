{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
        windowrulev2 = float, class:(firefox), title:^(Close Firefox)
        windowrule = float, class:^(firefox)
    '';
}
