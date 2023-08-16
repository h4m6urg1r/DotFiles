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
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
    };
    manual.manpages.enable = true;
    manual.html.enable = true;
    manual.json.enable = true;
    services.network-manager-applet.enable = true;
}
