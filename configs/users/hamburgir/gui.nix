{ config, inputs, pkgs, ... }: {
    xsession.windowManager.i3.enable = true;
    xsession.windowManager.awesome = {
        enable = false;
        luaModules = with pkgs.luaPackages; [
            luarocks
            luadbi-mysql
            lgi
        ];
    };

    wayland.windowManager.sway = {
        enable = true;
    };
    wayland.windowManager.hyprland = {
        enable = true;
        # extraConfig = config.hyprland.config.file;
        extraConfig = (builtins.readFile ./hamburgir.d/hypr/hyprland.conf);
        plugins = [
            inputs.hy3.packages.x86_64-linux.hy3
        ];
    };
}
