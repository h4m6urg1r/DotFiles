{ config, pkgs, ... }: {
    xsession.enable = true;
    xsession.windowManager.awesome = {
        enable = false;
        luaModules = with pkgs.luaPackages; [
            luarocks
            luadbi-mysql
            lgi
        ];
    };
    wayland.windowManager.hyprland = {
        enable = true;
        # extraConfig = config.hyprland.config.file;
        extraConfig = (builtins.readFile ./hamburgir.d/hypr/hyprland.conf);
    };
}
