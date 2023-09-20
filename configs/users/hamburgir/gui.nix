{ config, inputs, pkgs, ... }: {
    xsession.windowManager.i3 = {
        enable = true;
        config = {
            assigns = {
                "4" = [{ class = "^discord"; }];
            };
            modifier = "Mod4";
            terminal = "wezterm";
            startup = [
                { command = "discord"; }
            ];
            workspaceAutoBackAndForth = true;
        };
    };
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
            # inputs.hy3.packages.x86_64-linux.hy3
        ];
    };
}
