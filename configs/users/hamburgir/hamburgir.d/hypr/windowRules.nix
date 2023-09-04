{ config, ... }: {
    wayland.windowManager.hyprland.extraConfig = ''
        windowrulev2 = move 77% 76%, class:(firefox), title:(Picture-in-Picture)
        windowrulev2 = size 22% 22%, class:(firefox), title:(Picture-in-Picture)
        windowrulev2 = float, class:(firefox), title:(Picture-in-Picture)
        windowrulev2 = nofullscreenrequest, class:(firefox), title:(Picture-in-Picture)
        windowrulev2 = nomaximizerequest, class:(firefox), title:(Picture-in-Picture)

    '';
}
