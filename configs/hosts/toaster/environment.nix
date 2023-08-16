{ ... }: {
    environment.sessionVariables = {
        MOZ_USE_XINPUT2 = "1";
        NIXOS_OZONE_WL = "1";
    };
}
