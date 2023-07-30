{ pkgs, ... }: {
    #nixpkgs.overlays = [
    #    ( self: super: {
    #            discord = super.discord.overrideAttrs(
    #                old: {
    #                    nativeBuildInputs = ( old.nativeBuildInputs or []) ++ [ self.makeWrapper ];
    #                    postFixup = (old.postFixup or "") + '' wrapProgram $out/bin/discord --add-flags "--enable-features=UseOzonePlatform" --add-flags "--ozone-platform=wayland" '';
    #                }
    #            );
    #        }
    #    )
    #];
    imports = [
        ./files.nix
        ./gui.nix
        ./packages.nix
        ./sh.nix
        ./theme.nix
    ];

    home = {
        username = "hamburgir";
        homeDirectory = "/home/hamburgir";

        enableNixpkgsReleaseCheck = true;

        sessionPath = [ "$HOME/.local/bin" ];
        stateVersion = "22.11";
    };

    services.network-manager-applet.enable = true;
}
