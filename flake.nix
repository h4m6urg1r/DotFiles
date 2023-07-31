{
    description = "Hamburgir's desktop configurations";

    inputs = {
        # Nixpkgs
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

        # Home manager
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # TODO: Add any other flake you might need
        # hardware.url = "github:nixos/nixos-hardware";

        # Shameless plug: looking for a way to nixify your themes and make
        # everything match nicely? Try nix-colors!
        # nix-colors.url = "github:misterio77/nix-colors";
    };

    outputs = { nixpkgs, home-manager, ... }@inputs: 
        #let
        #    hm = {user, pkgs? nixpkgs.legacyPackages.x86_64-linux, extraArgs}: {
        #        user
        #    };
        #in
        {
            # NixOS configuration entrypoint
            # Available through 'nixos-rebuild --flake .#your-hostname'
            nixosConfigurations = {
                # FIXME replace with your hostname
                your-hostname = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; }; # Pass flake inputs to our config
                        # > Our main nixos configuration file <
                        modules = [ ./nixos/configuration.nix ];
                };
                Toaster = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };
                    modules = [ ./toaster ];
                };
            };

            # Standalone home-manager configuration entrypoint
            # Available through 'home-manager --flake .#your-username@your-hostname'
            homeConfigurations = {
                # FIXME replace with your username@hostname
                "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
                    extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
                    # > Our main home-manager configuration file <
                    modules = [ ./home-manager/home.nix ];
                };
                "hamburgir" = home-manager.lib.homeManagerConfiguration {
                    modules = [ ./users/hamburgir/home.nix ];
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;
                    extraSpecialArgs = { inherit inputs; };
                };
            };
        };
}
