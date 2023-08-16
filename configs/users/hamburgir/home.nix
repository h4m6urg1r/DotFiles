{ pkgs, ... }: {
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
        stateVersion = "23.05";
    };

    nixpkgs.config = {
        overlays = [
            # Add overlays your own flake exports (from overlays and pkgs dir):
            outputs.overlays.additions
            outputs.overlays.modifications
            outputs.overlays.unstable-packages

            # You can also add overlays exported from other flakes:
            # neovim-nightly-overlay.overlays.default

            # Or define it inline, for example:
            # (final: prev: {
            #   hi = final.hello.overrideAttrs (oldAttrs: {
            #     patches = [ ./change-hello-to-hi.patch ];
            #   });
            # })
        ];
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
    };
    manual.manpages.enable = true;
    manual.html.enable = true;
    manual.json.enable = true;
    services.network-manager-applet.enable = true;
}
